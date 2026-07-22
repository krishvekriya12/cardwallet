import 'card_type.dart';

class CardEntity {
  final int? id;
  final String holderName;
  final String cardNumber;
  final String cardType;
  final String cardTypeSubtitle;
  final String bankName;
  final String expiryDate;
  final String notes;

  /// Helper: returns the [CardType] enum parsed from [cardType] string.
  CardType get cardTypeEnum => CardType.fromValue(cardType);

  /// Either a solid hex color ("#6E3AFF") or a two-stop gradient encoded as
  /// "hex1,hex2". Null falls back to the card type's default gradient.
  final String? cardColor;

  final DateTime createdAt;
  final String? frontPhotoPath;
  final String? backPhotoPath;
  final int? statementDay;
  final int? dueDay;
  final bool reminderEnabled;

  /// Type-specific extra data (cvvNumber, pnrNumber, eventVenue, memberId,
  /// pointsBalance, reminderNote, reminderDateTime, ...).
  final Map<String, String> customFields;

  final int position;

  const CardEntity({
    this.id,
    required this.holderName,
    required this.cardNumber,
    required this.cardType,
    this.cardTypeSubtitle = '',
    required this.bankName,
    required this.expiryDate,
    this.notes = '',
    this.cardColor,
    required this.createdAt,
    this.frontPhotoPath,
    this.backPhotoPath,
    this.statementDay,
    this.dueDay,
    this.reminderEnabled = false,
    this.customFields = const {},
    this.position = 0,
  });

  CardEntity copyWith({
    int? id,
    String? holderName,
    String? cardNumber,
    String? cardType,
    String? cardTypeSubtitle,
    String? bankName,
    String? expiryDate,
    String? notes,
    String? cardColor,
    bool clearCardColor = false,
    String? frontPhotoPath,
    bool clearFrontPhotoPath = false,
    String? backPhotoPath,
    bool clearBackPhotoPath = false,
    int? statementDay,
    int? dueDay,
    bool? reminderEnabled,
    Map<String, String>? customFields,
    int? position,
  }) {
    return CardEntity(
      id: id ?? this.id,
      holderName: holderName ?? this.holderName,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      cardTypeSubtitle: cardTypeSubtitle ?? this.cardTypeSubtitle,
      bankName: bankName ?? this.bankName,
      expiryDate: expiryDate ?? this.expiryDate,
      notes: notes ?? this.notes,
      cardColor: clearCardColor ? null : (cardColor ?? this.cardColor),
      createdAt: createdAt,
      frontPhotoPath: clearFrontPhotoPath
          ? null
          : (frontPhotoPath ?? this.frontPhotoPath),
      backPhotoPath: clearBackPhotoPath
          ? null
          : (backPhotoPath ?? this.backPhotoPath),
      statementDay: statementDay ?? this.statementDay,
      dueDay: dueDay ?? this.dueDay,
      reminderEnabled: reminderEnabled ?? this.reminderEnabled,
      customFields: customFields ?? this.customFields,
      position: position ?? this.position,
    );
  }
}
