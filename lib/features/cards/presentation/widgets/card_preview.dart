import 'package:flutter/material.dart';

import '../../../../core/theme/card_palette.dart';
import '../../../../core/utils/card_utils.dart';
import '../../../../l10n/genrated/app_localizations.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/entities/card_type.dart';
import 'card_chip.dart';
import 'network_logo.dart';

/// Helper: CardEntity se Color parse karo
/// card.cardColor field = hex string OR empty
class CardPaletteHelper {
  static Color colorFromCard(CardEntity card) {
    try {
      if (card.cardColor != null && card.cardColor!.isNotEmpty) {
        final parts = card.cardColor!.split(',');
        return CardPalette.parseHex(parts[0]);
      }
    } catch (_) {}
    return card.cardTypeEnum.color; // fallback to type default
  }

  static Gradient? gradientFromCard(CardEntity card) {
    try {
      if (card.cardColor != null && card.cardColor!.contains(',')) {
        final parts = card.cardColor!.split(',');
        final colors = parts.map((h) => CardPalette.parseHex(h)).toList();
        return LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      }
    } catch (_) {}
    return null;
  }
}

/// A solid-color card mockup: type + bank on top, chip, card number, then
/// holder name / expiry with a network mark. Fully flat — no gradients. The
/// foreground (text/icons) flips to dark automatically on light card colors
/// so custom picks stay legible. Used for Add/Edit preview, Card Details and
/// the Home carousel.
class CardPreview extends StatelessWidget {
  final CardType type;
  final Color color;
  final Gradient? gradient;
  final String holderName;
  final String number;
  final String expiry;
  final String bankName;
  final bool masked;
  final bool showReminder;

  const CardPreview({
    super.key,
    required this.type,
    required this.color,
    this.gradient,
    required this.holderName,
    required this.number,
    required this.expiry,
    required this.bankName,
    this.masked = false,
    this.showReminder = false,
  });

  /// 📚 Named constructor — CardEntity se seedha CardPreview banao
  /// Hume manually type/color/holderName pass nahi karna padega.
  /// Usage: CardPreview.fromEntity(card: myCard)
  factory CardPreview.fromEntity({
    Key? key,
    required CardEntity card,
    bool masked = false,
    bool? showReminder,
  }) {
    return CardPreview(
      key: key,
      type: card.cardTypeEnum,
      color: CardPaletteHelper.colorFromCard(card),
      gradient: CardPaletteHelper.gradientFromCard(card),
      holderName: card.holderName,
      number: card.cardNumber,
      expiry: card.expiryDate,
      bankName: card.bankName,
      masked: masked,
      showReminder: showReminder ?? card.reminderEnabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final network = CardUtils.detectNetwork(number);
    final onCard =
        color.computeLuminance() < 0.55 ? Colors.white : const Color(0xFF17131F);
    final onCardMuted = onCard.withValues(alpha: 0.68);
    final ringColor = onCard.withValues(alpha: 0.08);

    final displayNumber = number.isEmpty
        ? (type.isPayment ? '0000  0000  0000  0000' : '—')
        : (masked && type.isPayment
              ? CardUtils.maskNumber(number)
              : (type.isPayment
                    ? CardUtils.formatCardNumber(number)
                    : number));

    final radius = BorderRadius.circular(22);

    return AspectRatio(
      aspectRatio: 1.586, // ISO card ratio
      child: Container(
        decoration: BoxDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: color.withValues(
                  alpha: Theme.of(context).brightness == Brightness.dark
                      ? 0.12
                      : 0.20),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              final isCompact = maxHeight < 170;

              final verticalPadding = isCompact ? 12.0 : 16.0;
              final gap1 = isCompact ? 6.0 : 12.0;
              final gap2 = isCompact ? 8.0 : 14.0;
              final chipWidth = isCompact ? 36.0 : 45.0;
              final numberFontSize = isCompact ? 18.0 : 23.0;
              final nameFontSize = isCompact ? 12.0 : 14.5;
              final labelFontSize = isCompact ? 11.0 : 13.0;
              final bankFontSize = isCompact ? 11.0 : 13.0;

              return Stack(
                children: [
                  // Flat concentric detailing (no gradients).
                  Positioned(right: -36, top: -46, child: _ring(160, ringColor)),
                  Positioned(right: -10, top: -20, child: _ring(100, ringColor)),
                  Positioned(left: -30, bottom: -50, child: _ring(140, ringColor)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: verticalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              type.getLocalizedLabel(context),
                              style: TextStyle(
                                color: onCardMuted,
                                fontSize: labelFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (showReminder) ...[
                              const SizedBox(width: 6),
                              Icon(
                                Icons.notifications_active_rounded,
                                color: onCard.withValues(alpha: 0.9),
                                size: isCompact ? 14 : 16,
                              ),
                            ],
                            const SizedBox(width: 16),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  bankName.isEmpty ? AppLocalizations.of(context)!.bankNameLabel : bankName,
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: onCard,
                                    fontSize: bankFontSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: gap1),
                        CardChip(width: chipWidth),
                        SizedBox(height: gap2),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            displayNumber,
                            style: TextStyle(
                              color: onCard,
                              fontSize: numberFontSize,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.5,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    holderName.isEmpty
                                        ? AppLocalizations.of(context)!.cardholderNameLabel.toUpperCase()
                                        : holderName.toUpperCase(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: onCard,
                                      fontSize: nameFontSize,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  if (type.isPayment) ...[
                                    const SizedBox(height: 3),
                                    Text(
                                      '${AppLocalizations.of(context)!.cardExpLabel}  ${expiry.isEmpty ? 'MM/YY' : expiry}',
                                      style: TextStyle(
                                        color: onCardMuted,
                                        fontSize: isCompact ? 10.0 : 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            type.isPayment
                                ? NetworkLogo(network: network, height: isCompact ? 20 : 28)
                                : Icon(type.icon, color: onCard, size: isCompact ? 20 : 26),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _ring(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 18),
      ),
    );
  }
}
