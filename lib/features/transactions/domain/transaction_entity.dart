/// A single parsed bank transaction for a card, persisted in `transactions`.
class TransactionEntity {
  final int? id;
  final int cardId;
  final double amount;
  final String type; // DEBIT | CREDIT
  final String merchant;
  final String date;
  final String time;
  final String rawSms;
  final String cardLastFour;
  final String? availableBalance;
  final int fetchedAt;

  const TransactionEntity({
    this.id,
    required this.cardId,
    required this.amount,
    required this.type,
    this.merchant = '',
    this.date = '',
    this.time = '',
    this.rawSms = '',
    this.cardLastFour = '',
    this.availableBalance,
    required this.fetchedAt,
  });

  bool get isDebit => type.toUpperCase() == 'DEBIT';

  Map<String, Object?> toMap() => {
        if (id != null) 'id': id,
        'cardId': cardId,
        'amount': amount,
        'type': type,
        'merchant': merchant,
        'date': date,
        'time': time,
        'rawSms': rawSms,
        'cardLastFour': cardLastFour,
        'availableBalance': availableBalance,
        'fetchedAt': fetchedAt,
      };

  factory TransactionEntity.fromMap(Map<String, Object?> map) {
    return TransactionEntity(
      id: map['id'] as int?,
      cardId: (map['cardId'] as int?) ?? 0,
      amount: (map['amount'] as num?)?.toDouble() ?? 0,
      type: (map['type'] as String?) ?? 'DEBIT',
      merchant: (map['merchant'] as String?) ?? '',
      date: (map['date'] as String?) ?? '',
      time: (map['time'] as String?) ?? '',
      rawSms: (map['rawSms'] as String?) ?? '',
      cardLastFour: (map['cardLastFour'] as String?) ?? '',
      availableBalance: map['availableBalance'] as String?,
      fetchedAt:
          (map['fetchedAt'] as int?) ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Equality on the natural transaction fields (ignoring id/fetchedAt) so we
  /// can de-duplicate re-scanned SMS.
  bool sameAs(TransactionEntity other) =>
      amount == other.amount &&
      type == other.type &&
      merchant.toLowerCase() == other.merchant.toLowerCase() &&
      date == other.date &&
      time == other.time &&
      rawSms == other.rawSms;
}
