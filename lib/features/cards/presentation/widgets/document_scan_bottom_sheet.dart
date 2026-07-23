import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../data/card_ocr_parser.dart';

class DocumentScanBottomSheet extends StatefulWidget {
  final CardOcrResult result;
  final VoidCallback onApply;
  final VoidCallback onRetake;

  const DocumentScanBottomSheet({
    super.key,
    required this.result,
    required this.onApply,
    required this.onRetake,
  });

  static Future<CardOcrResult?> show({
    required BuildContext context,
    required CardOcrResult result,
  }) {
    return showModalBottomSheet<CardOcrResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        CardOcrResult currentResult = result;
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DocumentScanBottomSheet(
              result: currentResult,
              onApply: () => Navigator.of(ctx).pop(currentResult),
              onRetake: () => Navigator.of(ctx).pop(null),
            );
          },
        );
      },
    );
  }

  @override
  State<DocumentScanBottomSheet> createState() => _DocumentScanBottomSheetState();
}

class _DocumentScanBottomSheetState extends State<DocumentScanBottomSheet> {
  late CardOcrResult _currentResult;

  @override
  void initState() {
    super.initState();
    _currentResult = widget.result;
  }

  void _editField(String label, String? currentValue, Function(String) onSave) {
    final controller = TextEditingController(text: currentValue ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit $label'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.of(ctx).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;
    final res = _currentResult;
    final hasFields = res.hasAnything;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.88,
      ),
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 42,
                height: 4.5,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: c.border,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),

            // Header Status Row
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: hasFields
                        ? Colors.green.withValues(alpha: 0.12)
                        : Colors.orange.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    hasFields ? Icons.check_circle_rounded : Icons.info_rounded,
                    color: hasFields ? Colors.green : Colors.orange,
                    size: 26,
                  ),
                ).animate().scale(duration: 350.ms, curve: Curves.elasticOut),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasFields ? 'Card Scan Successful!' : 'Partial Scan Completed',
                        style: TextStyle(
                          color: c.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${res.detectedFieldCount} Fields Auto-Detected',
                        style: TextStyle(
                          color: c.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: widget.onRetake,
                  icon: Icon(Icons.close_rounded, color: c.textSecondary, size: 22),
                  style: IconButton.styleFrom(
                    backgroundColor: c.surfaceAlt,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Card Type & Category Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.black.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.06),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: c.primary.withValues(alpha: isDark ? 0.20 : 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(res.detectedType.icon, color: c.primary, size: 19),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detected Card Type',
                          style: TextStyle(
                            color: c.textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          res.detectedType.getLocalizedLabel(context),
                          style: TextStyle(
                            color: c.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (res.cardBrand != null && res.cardBrand!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: c.primary.withValues(alpha: isDark ? 0.18 : 0.10),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        res.cardBrand!,
                        style: TextStyle(
                          color: c.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Scanned Image Thumbnail Preview
            if (res.imagePath != null && File(res.imagePath!).existsSync()) ...[
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: c.border),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.file(
                    File(res.imagePath!),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),
              ).animate().fadeIn(duration: 250.ms),
            ],

            const SizedBox(height: 16),
            Text(
              'EXTRACTED CARD DETAILS',
              style: TextStyle(
                color: c.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 8),

            // Extracted Field Tiles List
            Container(
              decoration: BoxDecoration(
                color: c.surfaceAlt,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: c.border),
              ),
              child: Column(
                children: [
                  _fieldTile(
                    icon: Icons.person_outline_rounded,
                    label: 'Cardholder Name',
                    value: res.holderName,
                    onEdit: () => _editField('Cardholder Name', res.holderName, (val) {
                      setState(() {
                        _currentResult = CardOcrResult(
                          number: res.number,
                          expiry: res.expiry,
                          holderName: val,
                          bankName: res.bankName,
                          cardBrand: res.cardBrand,
                          cvv: res.cvv,
                          detectedType: res.detectedType,
                          imagePath: res.imagePath,
                          confidence: res.confidence,
                        );
                      });
                    }),
                  ),
                  _fieldTile(
                    icon: Icons.credit_card_rounded,
                    label: 'Card Number',
                    value: res.number,
                    onEdit: () => _editField('Card Number', res.number, (val) {
                      setState(() {
                        _currentResult = CardOcrResult(
                          number: val,
                          expiry: res.expiry,
                          holderName: res.holderName,
                          bankName: res.bankName,
                          cardBrand: res.cardBrand,
                          cvv: res.cvv,
                          detectedType: res.detectedType,
                          imagePath: res.imagePath,
                          confidence: res.confidence,
                        );
                      });
                    }),
                  ),
                  _fieldTile(
                    icon: Icons.account_balance_rounded,
                    label: 'Bank Name',
                    value: res.bankName,
                    onEdit: () => _editField('Bank Name', res.bankName, (val) {
                      setState(() {
                        _currentResult = CardOcrResult(
                          number: res.number,
                          expiry: res.expiry,
                          holderName: res.holderName,
                          bankName: val,
                          cardBrand: res.cardBrand,
                          cvv: res.cvv,
                          detectedType: res.detectedType,
                          imagePath: res.imagePath,
                          confidence: res.confidence,
                        );
                      });
                    }),
                  ),
                  _fieldTile(
                    icon: Icons.event_rounded,
                    label: 'Expiry Date',
                    value: res.expiry,
                    onEdit: () => _editField('Expiry Date', res.expiry, (val) {
                      setState(() {
                        _currentResult = CardOcrResult(
                          number: res.number,
                          expiry: val,
                          holderName: res.holderName,
                          bankName: res.bankName,
                          cardBrand: res.cardBrand,
                          cvv: res.cvv,
                          detectedType: res.detectedType,
                          imagePath: res.imagePath,
                          confidence: res.confidence,
                        );
                      });
                    }),
                  ),
                  _fieldTile(
                    icon: Icons.security_rounded,
                    label: 'CVV Code',
                    value: res.cvv,
                    isLast: true,
                    onEdit: () => _editField('CVV Code', res.cvv, (val) {
                      setState(() {
                        _currentResult = CardOcrResult(
                          number: res.number,
                          expiry: res.expiry,
                          holderName: res.holderName,
                          bankName: res.bankName,
                          cardBrand: res.cardBrand,
                          cvv: val,
                          detectedType: res.detectedType,
                          imagePath: res.imagePath,
                          confidence: res.confidence,
                        );
                      });
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: widget.onRetake,
                    icon: const Icon(Icons.refresh_rounded, size: 18),
                    label: const Text('Re-Scan'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    label: 'Apply & Save Form',
                    onPressed: widget.onApply,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldTile({
    required IconData icon,
    required String label,
    required String? value,
    required VoidCallback onEdit,
    bool isLast = false,
  }) {
    final c = context.colors;
    final hasVal = value != null && value.trim().isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: c.divider)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: hasVal ? c.primary : c.textSecondary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: c.textSecondary, fontSize: 11),
                ),
                const SizedBox(height: 2),
                Text(
                  hasVal ? value : 'Not detected (Tap to enter)',
                  style: TextStyle(
                    color: hasVal ? c.textPrimary : Colors.amber.shade700,
                    fontWeight: hasVal ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined, size: 18, color: c.textSecondary),
            onPressed: onEdit,
            tooltip: 'Edit $label',
          ),
        ],
      ),
    );
  }
}
