import 'package:flutter/material.dart';

import '../../../../core/ads/interstitial_ad_manager.dart';
import '../../../../core/ads/native_ad_card_widget.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/card_utils.dart';
import '../../../../core/utils/input_formatters.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../cards/domain/entities/card_type.dart';
import '../../../cards/presentation/widgets/card_preview.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class CardValidatorScreen extends StatefulWidget {
  const CardValidatorScreen({super.key});

  @override
  State<CardValidatorScreen> createState() => _CardValidatorScreenState();
}

class _CardValidatorScreenState extends State<CardValidatorScreen> {
  final _controller = TextEditingController();

  void _validate() {
    final digits = _controller.text.replaceAll(RegExp(r'\D'), '');
    final isValid = digits.length >= 8 && CardUtils.luhnCheck(digits);

    // Throttled: only surfaces every Nth action, and never for premium users.
    InterstitialAdManager.instance.maybeShow(context);

    _showResultBottomSheet(context, isValid, digits);
  }

  void _showResultBottomSheet(
      BuildContext context, bool isValid, String digits) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final color = isValid ? c.success : c.error;
    final network = CardUtils.detectNetwork(digits);
    final masked = CardUtils.maskNumber(digits);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: MediaQuery.of(ctx).padding.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: c.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),

              // Result Card
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isValid
                            ? Icons.check_circle_rounded
                            : Icons.cancel_rounded,
                        color: color,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isValid
                                ? l10n.validCardNumber
                                : l10n.invalidCardNumber,
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          if (digits.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              '${network.label} • $masked',
                              style: TextStyle(
                                color: c.textSecondary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Native Ad below result
              const NativeAdCardWidget(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.cardValidatorTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardPreview(
                      type: CardType.credit,
                      color: context.colors.primary,
                      holderName: l10n.cardValidatorPreviewName,
                      number: _controller.text,
                      expiry: '',
                      bankName: '',
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      maxLength: 23,
                      style: TextStyle(
                          color: context.colors.textPrimary,
                          letterSpacing: 1.6),
                      inputFormatters: [CardNumberInputFormatter()],
                      decoration: InputDecoration(
                        labelText: l10n.enterCardNumberLabel,
                        counterText: '',
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: PrimaryButton(
                label: l10n.checkButton,
                icon: Icons.verified_outlined,
                onPressed: _validate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
