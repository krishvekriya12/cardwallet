import 'dart:convert';

import '../../domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  const CardModel({
    super.id,
    required super.holderName,
    required super.cardNumber,
    required super.cardType,
    super.cardTypeSubtitle,
    required super.bankName,
    required super.expiryDate,
    super.notes,
    super.cardColor,
    required super.createdAt,
    super.frontPhotoPath,
    super.backPhotoPath,
    super.statementDay,
    super.dueDay,
    super.reminderEnabled,
    super.customFields,
    super.position,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) {
    final customFieldsRaw = map['customFields'];
    Map<String, String> customFields = const {};
    if (customFieldsRaw != null) {
      if (customFieldsRaw is String && customFieldsRaw.isNotEmpty) {
        try {
          final decoded = jsonDecode(customFieldsRaw) as Map<String, dynamic>;
          customFields = decoded.map((k, v) => MapEntry(k, v.toString()));
        } catch (_) {}
      } else if (customFieldsRaw is Map) {
        customFields = customFieldsRaw.map((k, v) => MapEntry(k.toString(), v.toString()));
      }
    }

    DateTime createdAt;
    final createdAtRaw = map['createdAt'];
    if (createdAtRaw is int) {
      createdAt = DateTime.fromMillisecondsSinceEpoch(createdAtRaw);
    } else if (createdAtRaw is double) {
      createdAt = DateTime.fromMillisecondsSinceEpoch(createdAtRaw.toInt());
    } else if (createdAtRaw is String) {
      createdAt = DateTime.tryParse(createdAtRaw) ?? DateTime.now();
    } else {
      createdAt = DateTime.now();
    }

    final reminderRaw = map['reminderEnabled'];
    final bool reminderEnabled = reminderRaw == true || reminderRaw == 1;

    return CardModel(
      id: map['id'] as int?,
      holderName: (map['holderName'] as String?) ?? '',
      cardNumber: (map['cardNumber'] as String?) ?? '',
      cardType: (map['cardType'] as String?) ?? '',
      cardTypeSubtitle: (map['cardTypeSubtitle'] as String?) ?? '',
      bankName: (map['bankName'] as String?) ?? '',
      expiryDate: (map['expiryDate'] as String?) ?? '',
      notes: (map['notes'] as String?) ?? '',
      cardColor: map['cardColor'] as String?,
      createdAt: createdAt,
      frontPhotoPath: map['frontPhotoPath'] as String?,
      backPhotoPath: map['backPhotoPath'] as String?,
      statementDay: map['statementDay'] as int?,
      dueDay: map['dueDay'] as int?,
      reminderEnabled: reminderEnabled,
      customFields: customFields,
      position: map['position'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null && id != 0) 'id': id,
      'holderName': holderName,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'cardTypeSubtitle': cardTypeSubtitle,
      'bankName': bankName,
      'expiryDate': expiryDate,
      'notes': notes,
      'cardColor': cardColor,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'frontPhotoPath': frontPhotoPath,
      'backPhotoPath': backPhotoPath,
      'statementDay': statementDay,
      'dueDay': dueDay,
      'reminderEnabled': reminderEnabled ? 1 : 0,
      'customFields': customFields.isEmpty ? null : jsonEncode(customFields),
      'position': position,
    };
  }

  factory CardModel.fromEntity(CardEntity entity) {
    return CardModel(
      id: entity.id,
      holderName: entity.holderName,
      cardNumber: entity.cardNumber,
      cardType: entity.cardType,
      cardTypeSubtitle: entity.cardTypeSubtitle,
      bankName: entity.bankName,
      expiryDate: entity.expiryDate,
      notes: entity.notes,
      cardColor: entity.cardColor,
      createdAt: entity.createdAt,
      frontPhotoPath: entity.frontPhotoPath,
      backPhotoPath: entity.backPhotoPath,
      statementDay: entity.statementDay,
      dueDay: entity.dueDay,
      reminderEnabled: entity.reminderEnabled,
      customFields: entity.customFields,
      position: entity.position,
    );
  }
}
