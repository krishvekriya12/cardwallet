import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../bin_checker/data/bin_lookup_api.dart';
import '../../data/card_ocr_parser.dart';
import '../widgets/document_scan_bottom_sheet.dart';
import 'add_card_screen.dart';

class CardScanScreen extends StatefulWidget {
  const CardScanScreen({super.key});

  @override
  State<CardScanScreen> createState() => _CardScanScreenState();
}

class _CardScanScreenState extends State<CardScanScreen> {
  final _recognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final _picker = ImagePicker();
  bool _processing = false;
  String? _statusText;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scanWithDocumentScanner();
    });
  }

  @override
  void dispose() {
    _recognizer.close();
    super.dispose();
  }

  Future<void> _scanWithDocumentScanner() async {
    if (_processing) return;
    setState(() {
      _processing = true;
      _statusText = 'Opening Scanner...';
    });

    try {
      final cameraStatus = await Permission.camera.request();
      if (!cameraStatus.isGranted) {
        if (!mounted) return;
        setState(() {
          _processing = false;
          _statusText = 'Camera permission required';
        });
        return;
      }

      final List<String>? pictures = await CunningDocumentScanner.getPictures();
      if (!mounted) return;

      if (pictures != null && pictures.isNotEmpty) {
        await _processPaths(pictures);
        return;
      }

      setState(() {
        _processing = false;
        _statusText = 'Scan cancelled or no photo captured';
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _processing = false;
          _statusText = 'Scanner error: $e';
        });
      }
    }
  }

  Future<void> _pickFromGallery() async {
    if (_processing) return;
    setState(() {
      _processing = true;
      _statusText = 'Reading Gallery image...';
    });

    try {
      final file = await _picker.pickImage(source: ImageSource.gallery);
      if (!mounted) return;
      if (file != null) {
        await _processPaths([file.path]);
        return;
      }
      setState(() {
        _processing = false;
        _statusText = null;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _processing = false;
          _statusText = 'Gallery error: $e';
        });
      }
    }
  }

  Future<void> _processPaths(List<String> paths) async {
    setState(() => _statusText = 'Analyzing Card with AI ML...');
    try {
      final frontPath = paths.first;
      final backPath = paths.length > 1 ? paths[1] : null;

      final inputImageFront = InputImage.fromFilePath(frontPath);
      final recognizedFront = await _recognizer.processImage(inputImageFront);

      RecognizedText? recognizedBack;
      if (backPath != null) {
        try {
          final inputImageBack = InputImage.fromFilePath(backPath);
          recognizedBack = await _recognizer.processImage(inputImageBack);
        } catch (_) {}
      }

      final allBlocks = [
        ...recognizedFront.blocks,
        if (recognizedBack != null) ...recognizedBack.blocks,
      ];
      final combinedText = recognizedFront.text + (recognizedBack != null ? '\n\n${recognizedBack.text}' : '');

      final parsed = CardOcrParser.parseRecognizedText(
        RecognizedText(text: combinedText, blocks: allBlocks),
        imagePath: frontPath,
      );

      HapticFeedback.mediumImpact();
      String? bankName = parsed.bankName;

      if (bankName == null && parsed.number != null) {
        final digits = parsed.number!.replaceAll(RegExp(r'\D'), '');
        if (digits.length >= 6) {
          try {
            final result = await BinLookupApi.lookup(digits.substring(0, 8.clamp(0, digits.length)));
            if (result.valid && result.bank.isNotEmpty && result.bank != '—') {
              bankName = result.bank;
            }
          } catch (_) {}
        }
      }

      if (!mounted) return;
      final finalResult = await DocumentScanBottomSheet.show(
        context: context,
        result: parsed,
      );

      if (finalResult != null && mounted) {
        context.pushReplacement(
          '/add-card',
          extra: AddCardArgs(
            initialType: finalResult.detectedType,
            prefillNumber: finalResult.number,
            prefillExpiry: finalResult.expiry,
            prefillHolderName: finalResult.holderName,
            prefillBankName: finalResult.bankName ?? bankName,
            prefillCvv: finalResult.cvv,
            brandName: finalResult.cardBrand,
            prefillFrontPhotoPath: frontPath,
            prefillBackPhotoPath: backPath,
          ),
        );
      } else if (mounted) {
        setState(() {
          _processing = false;
          _statusText = 'Scan review cancelled';
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _processing = false;
          _statusText = 'ML Processing error: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: const Text('AI Card Scanner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_processing) ...[
                  const ExpressiveLoadingIndicator(
                    color: AppColors.white,
                    constraints: BoxConstraints.tightFor(width: 48, height: 48),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _statusText ?? 'Scanning Card...',
                    style: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ] else ...[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.document_scanner_rounded, color: Colors.amber, size: 40),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Scan Your Card',
                    style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (_statusText != null)
                    Text(
                      _statusText!,
                      style: TextStyle(color: Colors.amber.shade200, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _scanWithDocumentScanner,
                      icon: const Icon(Icons.camera_alt_rounded),
                      label: const Text('Launch Document Scanner', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: _pickFromGallery,
                      icon: const Icon(Icons.photo_library_rounded, color: AppColors.white),
                      label: const Text('Import Card Photo from Gallery', style: TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white38),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
