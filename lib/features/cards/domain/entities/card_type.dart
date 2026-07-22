import 'package:flutter/material.dart';

import '../../../../core/theme/card_palette.dart';
import '../../../../l10n/genrated/app_localizations.dart';

/// The 8 card categories the original app supports. Stored on [CardEntity]
/// as its `.label` string so existing/ported data stays stable.
enum CardType {
  credit('Credit Card', 'Payment Card', Icons.credit_card_rounded),
  debit('Debit Card', 'Payment Card', Icons.account_balance_wallet_rounded),
  point('Point Card', 'Loyalty & Points', Icons.stars_rounded),
  membership('Membership Card', 'Membership', Icons.badge_rounded),
  coupon('Coupon', 'Discounts & Offers', Icons.local_offer_rounded),
  gift('Gift Card', 'Gift Card', Icons.card_giftcard_rounded),
  eventTicket('Event Ticket', 'Tickets & Passes', Icons.confirmation_num_rounded),
  other('Other', 'Custom Card', Icons.dashboard_customize_rounded);

  final String label;
  final String defaultSubtitle;
  final IconData icon;

  const CardType(this.label, this.defaultSubtitle, this.icon);

  bool get isPayment => this == CardType.credit || this == CardType.debit;

  /// Alias for label — used in UI
  String get displayName => label;

  String getLocalizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case CardType.credit: return l10n.cardTypeCredit;
      case CardType.debit: return l10n.cardTypeDebit;
      case CardType.point: return l10n.cardTypePoint;
      case CardType.membership: return l10n.cardTypeMembership;
      case CardType.coupon: return l10n.cardTypeCoupon;
      case CardType.gift: return l10n.cardTypeGift;
      case CardType.eventTicket: return l10n.cardTypeEventTicket;
      case CardType.other: return l10n.cardTypeOther;
    }
  }

  /// Default solid color for this type.
  Color get color => CardPalette.typeDefaults[index];

  static CardType fromValue(String value) {
    return CardType.values.firstWhere(
      (t) => t.label == value,
      orElse: () => CardType.other,
    );
  }
}
