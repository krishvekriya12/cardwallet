import 'dart:async';
import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/ads/interstitial_ad_manager.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/card_utils.dart';
import '../../../../core/utils/input_formatters.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../bin_checker/data/bin_lookup_api.dart';
import '../../data/card_ocr_parser.dart';
import '../../data/card_photo_storage.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/entities/card_type.dart';
import '../providers/card_providers.dart';
import '../widgets/card_color.dart';
import '../widgets/card_color_picker.dart';
import '../widgets/card_preview.dart';
import '../widgets/card_type_sheet.dart';
import '../widgets/document_scan_bottom_sheet.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class AddCardArgs {
  final CardType? initialType;
  final String? brandName;
  final int? cardId;
  final String? prefillNumber;
  final String? prefillExpiry;
  final String? prefillHolderName;
  final String? prefillBankName;
  final String? prefillCvv;
  final String? prefillFrontPhotoPath;
  final String? prefillBackPhotoPath;

  const AddCardArgs({
    this.initialType,
    this.brandName,
    this.cardId,
    this.prefillNumber,
    this.prefillExpiry,
    this.prefillHolderName,
    this.prefillBankName,
    this.prefillCvv,
    this.prefillFrontPhotoPath,
    this.prefillBackPhotoPath,
  });
}

class AddCardScreen extends ConsumerStatefulWidget {
  final AddCardArgs args;

  const AddCardScreen({super.key, this.args = const AddCardArgs()});

  @override
  ConsumerState<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends ConsumerState<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();

  late CardType _type;
  String? _cardColor;
  CardEntity? _editingCard;
  bool _loadedForEdit = false;
  bool _saving = false;

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _bankController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _notesController = TextEditingController();

  Timer? _binDebounce;
  String? _lastLookedUpBin;
  bool _bankAutoFilled = false;
  String? _duplicateError;
  String? _frontPhotoPath;
  String? _backPhotoPath;
  XFile? _tempFrontFile;
  XFile? _tempBackFile;
  bool _clearFrontPhoto = false;
  bool _clearBackPhoto = false;

  bool get _isEditing => widget.args.cardId != null;

  @override
  void initState() {
    super.initState();
    _type = widget.args.initialType ?? CardType.credit;
    if (widget.args.brandName != null) {
      _nameController.text = widget.args.brandName!;
    }
    if (widget.args.prefillHolderName != null) {
      _nameController.text = widget.args.prefillHolderName!;
    }
    if (widget.args.prefillNumber != null) {
      _numberController.text = widget.args.prefillNumber!;
    }
    if (widget.args.prefillExpiry != null) {
      _expiryController.text = widget.args.prefillExpiry!;
    }
    if (widget.args.prefillBankName != null) {
      _bankController.text = widget.args.prefillBankName!;
    }
    if (widget.args.prefillCvv != null) {
      _cvvController.text = widget.args.prefillCvv!;
    }
    if (widget.args.prefillFrontPhotoPath != null) {
      _frontPhotoPath = widget.args.prefillFrontPhotoPath!;
    }
    if (widget.args.prefillBackPhotoPath != null) {
      _backPhotoPath = widget.args.prefillBackPhotoPath!;
    }
    for (final c in [
      _nameController,
      _numberController,
      _bankController,
      _expiryController,
    ]) {
      c.addListener(_onFieldChanged);
    }
    _numberController.addListener(_onNumberChangedForBinLookup);
    _bankController.addListener(() {
      if (_bankController.text.trim().isEmpty) _bankAutoFilled = false;
    });
  }

  void _onFieldChanged() => setState(() => _duplicateError = null);

  void _onNumberChangedForBinLookup() {
    if (!_type.isPayment) return;
    final digits = _numberController.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 6) return;
    final bin = digits.substring(0, 8.clamp(0, digits.length));

    // Only auto-fill while the bank field is empty or was itself
    // auto-filled, so we never clobber something the user typed.
    if (_bankController.text.trim().isNotEmpty && !_bankAutoFilled) return;
    if (bin == _lastLookedUpBin) return;

    _binDebounce?.cancel();
    _binDebounce = Timer(const Duration(milliseconds: 500), () async {
      _lastLookedUpBin = bin;
      try {
        final result = await BinLookupApi.lookup(bin);
        if (!mounted) return;
        if (result.valid && result.bank.isNotEmpty && result.bank != '—') {
          setState(() {
            _bankController.text = result.bank;
            _bankAutoFilled = true;
          });
        }
      } catch (_) {
        // Silent — bank name is a nice-to-have, not a blocker.
      }
    });
  }

  @override
  void dispose() {
    _binDebounce?.cancel();
    _nameController.dispose();
    _numberController.dispose();
    _bankController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _applyCardToForm(CardEntity card) {
    _type = CardType.fromValue(card.cardType);
    _cardColor = card.cardColor;
    _nameController.text = card.holderName;
    _numberController.text = card.cardNumber;
    _bankController.text = card.bankName;
    _expiryController.text = card.expiryDate;
    _cvvController.text = card.customFields['cvvNumber'] ?? '';
    _notesController.text = card.notes;
    _frontPhotoPath = card.frontPhotoPath;
    _backPhotoPath = card.backPhotoPath;
  }

  Future<void> _pickType() async {
    final picked = await showCardTypeSheet(context, _type);
    if (picked != null) setState(() => _type = picked);
  }

  String _numberLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (_type) {
      case CardType.credit:
      case CardType.debit:
        return l10n.cardNumberLabel;
      case CardType.point:
        return l10n.pointCardNumberLabel;
      case CardType.membership:
        return l10n.membershipIdLabel;
      case CardType.coupon:
        return l10n.couponCodeLabel;
      case CardType.gift:
        return l10n.giftCardNumberLabel;
      case CardType.eventTicket:
        return l10n.ticketPnrLabel;
      case CardType.other:
        return l10n.numberLabel;
    }
  }

  String _nameLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _type.isPayment ? l10n.cardholderNameLabel : l10n.cardNameLabel;
  }

  String? _validateNumber(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (_type.isPayment) {
      if (digits.length < 8 || digits.length > 19) {
        return l10n.enterValidCardNumberError;
      }
      if (!CardUtils.luhnCheck(digits)) {
        return l10n.cardNumberInvalidError;
      }
      return null;
    }
    if ((value ?? '').trim().length < 3) {
      return l10n.enterMin3CharsError;
    }
    return null;
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _saving = true;
      _duplicateError = null;
    });

    final duplicate = await ref
        .read(cardActionsProvider)
        .numberExists(_numberController.text, excludeId: _editingCard?.id);
    if (duplicate) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _duplicateError = l10n.cardAlreadyExistsError;
      });
      return;
    }

    final customFields = <String, String>{
      ...(_editingCard?.customFields ?? {}),
    };
    if (_type.isPayment && _cvvController.text.trim().isNotEmpty) {
      customFields['cvvNumber'] = _cvvController.text.trim();
    }

    final actions = ref.read(cardActionsProvider);
    final cardId = _editingCard?.id;

    String? finalFrontPath = _clearFrontPhoto ? null : (_frontPhotoPath ?? _editingCard?.frontPhotoPath);
    String? finalBackPath = _clearBackPhoto ? null : (_backPhotoPath ?? _editingCard?.backPhotoPath);

    if (_isEditing && cardId != null) {
      if (_tempFrontFile != null) {
        finalFrontPath = await CardPhotoStorage.save(_tempFrontFile!, cardId, 'front');
        CardPhotoStorage.deleteQuietly(_editingCard?.frontPhotoPath);
      }
      if (_tempBackFile != null) {
        finalBackPath = await CardPhotoStorage.save(_tempBackFile!, cardId, 'back');
        CardPhotoStorage.deleteQuietly(_editingCard?.backPhotoPath);
      }

      final entity = CardEntity(
        id: cardId,
        holderName: _nameController.text.trim(),
        cardNumber: _numberController.text.trim(),
        cardType: _type.label,
        cardTypeSubtitle: _type.defaultSubtitle,
        bankName: _bankController.text.trim(),
        expiryDate: _expiryController.text.trim(),
        notes: _notesController.text.trim(),
        cardColor: _cardColor,
        createdAt: _editingCard?.createdAt ?? DateTime.now(),
        frontPhotoPath: finalFrontPath,
        backPhotoPath: finalBackPath,
        statementDay: _editingCard?.statementDay,
        dueDay: _editingCard?.dueDay,
        reminderEnabled: _editingCard?.reminderEnabled ?? false,
        customFields: customFields,
        position: _editingCard?.position ?? 0,
      );
      await actions.updateCard(entity);
    } else {
      final entityBeforePhotos = CardEntity(
        holderName: _nameController.text.trim(),
        cardNumber: _numberController.text.trim(),
        cardType: _type.label,
        cardTypeSubtitle: _type.defaultSubtitle,
        bankName: _bankController.text.trim(),
        expiryDate: _expiryController.text.trim(),
        notes: _notesController.text.trim(),
        cardColor: _cardColor,
        createdAt: DateTime.now(),
        frontPhotoPath: null,
        backPhotoPath: null,
        reminderEnabled: false,
        customFields: customFields,
        position: 0,
      );

      final newId = await actions.insertCard(entityBeforePhotos);

      if (_tempFrontFile != null) {
        finalFrontPath = await CardPhotoStorage.save(_tempFrontFile!, newId, 'front');
      }
      if (_tempBackFile != null) {
        finalBackPath = await CardPhotoStorage.save(_tempBackFile!, newId, 'back');
      }

      if (finalFrontPath != null || finalBackPath != null) {
        final entityWithPhotos = entityBeforePhotos.copyWith(
          id: newId,
          frontPhotoPath: finalFrontPath,
          backPhotoPath: finalBackPath,
        );
        await actions.updateCard(entityWithPhotos);
      }
    }

    if (!mounted) return;
    setState(() => _saving = false);
    InterstitialAdManager.instance.showOnCardSave(
      context: context,
      onComplete: () {
        if (!mounted) return;
        context.pop();
      },
    );
  }

  Future<void> _delete() async {
    final confirm = await _confirmDelete(context);
    if (confirm != true) return;
    await ref.read(cardActionsProvider).deleteCard(widget.args.cardId!);
    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_isEditing && !_loadedForEdit) {
      final asyncCard = ref.watch(cardByIdProvider(widget.args.cardId!));
      return asyncCard.when(
        data: (card) {
          if (card == null) {
            return Scaffold(
              body: Center(child: Text(l10n.cardNotFound)),
            );
          }
          _editingCard = card;
          _applyCardToForm(card);
          _loadedForEdit = true;
          return _buildForm(context);
        },
        loading: () => Scaffold(
          body: Center(
            child: ExpressiveLoadingIndicator(
              color: context.colors.primary,
              constraints: const BoxConstraints.tightFor(width: 36, height: 36),
            ),
          ),
        ),
        error: (e, st) => Scaffold(body: Center(child: Text('$e'))),
      );
    }
    return _buildForm(context);
  }

  Future<void> _scanCardInPlace() async {
    try {
      final pictures = await CunningDocumentScanner.getPictures();
      if (!mounted) return;
      if (pictures != null && pictures.isNotEmpty) {
        final frontPath = pictures.first;
        final backPath = pictures.length > 1 ? pictures[1] : null;

        final inputImageFront = InputImage.fromFilePath(frontPath);
        final recognizer = TextRecognizer(script: TextRecognitionScript.latin);
        final recognizedFront = await recognizer.processImage(inputImageFront);

        RecognizedText? recognizedBack;
        if (backPath != null) {
          try {
            final inputImageBack = InputImage.fromFilePath(backPath);
            recognizedBack = await recognizer.processImage(inputImageBack);
          } catch (_) {}
        }
        await recognizer.close();

        final allBlocks = [
          ...recognizedFront.blocks,
          if (recognizedBack != null) ...recognizedBack.blocks,
        ];
        final combinedText = recognizedFront.text + (recognizedBack != null ? '\n\n${recognizedBack.text}' : '');

        final parsed = CardOcrParser.parseRecognizedText(
          RecognizedText(text: combinedText, blocks: allBlocks),
          imagePath: frontPath,
        );

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
        HapticFeedback.mediumImpact();

        final finalResult = await DocumentScanBottomSheet.show(
          context: context,
          result: parsed,
        );

        if (finalResult != null && mounted) {
          setState(() {
            _type = finalResult.detectedType;
            if (finalResult.holderName != null && finalResult.holderName!.isNotEmpty) {
              _nameController.text = finalResult.holderName!;
            }
            if (finalResult.number != null && finalResult.number!.isNotEmpty) {
              _numberController.text = finalResult.number!;
            }
            if (finalResult.expiry != null && finalResult.expiry!.isNotEmpty) {
              _expiryController.text = finalResult.expiry!;
            }
            if (finalResult.bankName != null && finalResult.bankName!.isNotEmpty) {
              _bankController.text = finalResult.bankName!;
            }
            if (finalResult.cvv != null && finalResult.cvv!.isNotEmpty) {
              _cvvController.text = finalResult.cvv!;
            }
            _frontPhotoPath = frontPath;
            if (backPath != null) _backPhotoPath = backPath;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: Colors.greenAccent),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Scanned & auto-filled ${finalResult.detectedFieldCount} fields!',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.black,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanning error: $e')),
      );
    }
  }

  Widget _buildForm(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final tempCard = CardEntity(
      holderName: '',
      cardNumber: '',
      cardType: _type.label,
      bankName: '',
      expiryDate: '',
      cardColor: _cardColor,
      createdAt: DateTime.now(),
    );
    final color = resolveCardColor(tempCard);
    final gradient = resolveCardGradient(tempCard);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? l10n.editCardTitle : l10n.addCardTitle),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              CardPreview(
                type: _type,
                color: color,
                gradient: gradient,
                holderName: _nameController.text,
                number: _numberController.text,
                expiry: _expiryController.text,
                bankName: _bankController.text,
              ),
              const SizedBox(height: 20),
              _label(context, l10n.cardTypeLabel),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickType,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: c.surfaceAlt,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: c.border),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: _type.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(_type.icon, size: 15, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _type.getLocalizedLabel(context),
                          style: TextStyle(
                            color: c.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.expand_more_rounded,
                        color: c.textSecondary,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _label(context, l10n.cardColorLabel),
              const SizedBox(height: 10),
              CardColorPicker(
                selectedColor: _cardColor,
                onChanged: (v) => setState(() => _cardColor = v),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: c.textPrimary),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(labelText: _nameLabel(context)),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? l10n.fieldRequiredError
                    : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _numberController,
                style: TextStyle(
                  color: c.textPrimary,
                  letterSpacing: _type.isPayment ? 1.6 : 0,
                ),
                keyboardType: _type.isPayment
                    ? TextInputType.number
                    : TextInputType.text,
                inputFormatters: _type.isPayment
                    ? [CardNumberInputFormatter()]
                    : null,
                decoration: InputDecoration(labelText: _numberLabel(context)),
                validator: (v) => _validateNumber(context, v),
              ),
              if (_duplicateError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    _duplicateError!,
                    style: TextStyle(color: c.error, fontSize: 12),
                  ),
                ),
              if (_type.isPayment) ...[
                const SizedBox(height: 14),
                TextFormField(
                  controller: _bankController,
                  style: TextStyle(color: c.textPrimary),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(labelText: l10n.bankNameLabel),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryController,
                        style: TextStyle(color: c.textPrimary),
                        keyboardType: TextInputType.number,
                        inputFormatters: [ExpiryDateInputFormatter()],
                        decoration: InputDecoration(
                          labelText: l10n.expiryLabel,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        style: TextStyle(color: c.textPrimary),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        maxLength: 4,
                        decoration: InputDecoration(
                          labelText: l10n.cvvLabel,
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),
              _label(context, l10n.cardPhotosLabel),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildPhotoSlot(
                      label: l10n.frontSideLabel,
                      savedPath: _frontPhotoPath,
                      tempFile: _tempFrontFile,
                      onPick: () => _pickPhoto('front'),
                      onRemove: () {
                        setState(() {
                          _tempFrontFile = null;
                          _frontPhotoPath = null;
                          _clearFrontPhoto = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildPhotoSlot(
                      label: l10n.backSideLabel,
                      savedPath: _backPhotoPath,
                      tempFile: _tempBackFile,
                      onPick: () => _pickPhoto('back'),
                      onRemove: () {
                        setState(() {
                          _tempBackFile = null;
                          _backPhotoPath = null;
                          _clearBackPhoto = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _notesController,
                style: TextStyle(color: c.textPrimary),
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: l10n.notesLabel),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: _isEditing ? l10n.saveChangesBtn : l10n.saveCardBtn,
                loading: _saving,
                onPressed: _saving ? null : _save,
              ),
              if (_isEditing) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: _delete,
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: c.error,
                    ),
                    label: Text(
                      l10n.deleteCardBtn,
                      style: TextStyle(color: c.error),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(BuildContext context, String text) => Text(
    text,
    style: TextStyle(
      color: context.colors.textSecondary,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
  );
  Widget _buildPhotoSlot({
    required String label,
    required String? savedPath,
    required XFile? tempFile,
    required VoidCallback onPick,
    required VoidCallback onRemove,
  }) {
    final c = context.colors;
    final hasPhoto = (tempFile != null) || (savedPath != null && File(savedPath).existsSync());
    final imageProvider = tempFile != null
        ? FileImage(File(tempFile.path))
        : (savedPath != null ? FileImage(File(savedPath)) : null);

    return AspectRatio(
      aspectRatio: 1.586,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onPick,
            child: Container(
              decoration: BoxDecoration(
                color: c.surfaceAlt,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: c.primary.withValues(alpha: 0.35),
                  width: 1.5,
                  style: hasPhoto ? BorderStyle.none : BorderStyle.solid,
                ),
                image: imageProvider != null
                    ? DecorationImage(
                        image: imageProvider as ImageProvider,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: !hasPhoto
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_rounded,
                            color: c.primary,
                            size: 24,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            label,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: c.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          if (hasPhoto)
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickPhoto(String slot) async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.photo_camera_rounded, color: c.primary),
              title: Text(l10n.takePhotoLabel),
              onTap: () async {
                Navigator.pop(context);
                final file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 85);
                if (file != null) {
                  setState(() {
                    if (slot == 'front') {
                      _tempFrontFile = file;
                      _clearFrontPhoto = false;
                    } else {
                      _tempBackFile = file;
                      _clearBackPhoto = false;
                    }
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library_rounded, color: c.primary),
              title: Text(l10n.chooseGalleryLabel),
              onTap: () async {
                Navigator.pop(context);
                final file = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 85);
                if (file != null) {
                  setState(() {
                    if (slot == 'front') {
                      _tempFrontFile = file;
                      _clearFrontPhoto = false;
                    } else {
                      _tempBackFile = file;
                      _clearBackPhoto = false;
                    }
                  });
                }
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

Future<bool?> _confirmDelete(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.deleteCardPrompt),
      content: Text(l10n.deleteCardWarning),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(l10n.deleteBtn, style: TextStyle(color: context.colors.error)),
        ),
      ],
    ),
  );
}
