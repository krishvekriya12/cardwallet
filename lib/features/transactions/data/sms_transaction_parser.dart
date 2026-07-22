import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

import '../domain/transaction_entity.dart';

class SmsScanStats {
  final int totalScanned;
  final int last4Matched;
  final int cardFoundButMismatch;
  final int noAmount;
  final int noType;
  final int debit;
  final int credit;

  const SmsScanStats({
    this.totalScanned = 0,
    this.last4Matched = 0,
    this.cardFoundButMismatch = 0,
    this.noAmount = 0,
    this.noType = 0,
    this.debit = 0,
    this.credit = 0,
  });
}

class SmsScanResult {
  final List<TransactionEntity> transactions;
  final SmsScanStats stats;
  const SmsScanResult(this.transactions, this.stats);
}

/// Reads the device SMS inbox and extracts bank transaction messages that
/// reference a given card's last-four digits. Generalized across banks: it
/// keys off the standard "a/c XX1234" / "card ending 1234" + amount + debit or
/// credit keywords rather than a single bank's sender ids.
class SmsTransactionParser {
  SmsTransactionParser._();

  static final _accLast4 =
      RegExp(r'a/c\s+[Xx*]{2,4}(\d{4})', caseSensitive: false);
  static final _cardEnding = RegExp(
      r'(?:card|a/c|acct|account)\s+(?:ending\s+)?(?:[Xx*]{2,6})?(\d{4})',
      caseSensitive: false);
  static final _amount =
      RegExp(r'(?:Rs\.?|INR|₹)\s*([\d,]+(?:\.\d{1,2})?)', caseSensitive: false);
  static final _debit =
      RegExp(r'(?:debit(?:ed)?|spent|withdrawn|paid|purchase)', caseSensitive: false);
  static final _credit =
      RegExp(r'(?:credit(?:ed)?|received|deposited|refund)', caseSensitive: false);
  static final _merchant = RegExp(
      r"(?:at|to|for|towards)\s+([A-Z0-9 _\-&'.*/]+?)(?:\s+on\s+|\s*[.!,]|\s*Avl|\s*$)",
      caseSensitive: false);
  static final _date = RegExp(
      r'\b(\d{1,2}[-/][A-Za-z]{3}(?:[-/]\d{2,4})?|\d{1,2}/\d{1,2}/\d{2,4}|\d{4}-\d{2}-\d{2})\b');
  static final _time = RegExp(r'\b(\d{1,2}:\d{2}(?::\d{2})?)\b');
  static final _balance = RegExp(
      r'(?:Avl\.?\s*(?:Bal\.?|Cr\.?\s*Limit)?|Available\s+Balance|Bal)[:\s]+(?:Rs\.?|INR|₹)\s*([\d,]+(?:\.\d{1,2})?)',
      caseSensitive: false);

  static String? _extractLast4(String body) {
    final acc = _accLast4.firstMatch(body);
    if (acc != null) return acc.group(1);
    final card = _cardEnding.firstMatch(body);
    return card?.group(1);
  }

  static Future<SmsScanResult> scan({
    required int cardId,
    required String cardLastFour,
    int limit = 25,
  }) async {
    final last4 = cardLastFour.replaceAll(RegExp(r'\D'), '');
    final target = last4.length >= 4 ? last4.substring(last4.length - 4) : last4;

    final query = SmsQuery();
    final messages = await query.querySms(
      kinds: [SmsQueryKind.inbox],
      sort: true,
    );

    final results = <TransactionEntity>[];
    var totalScanned = 0;
    var last4Matched = 0;
    var mismatch = 0;
    var noAmount = 0;
    var noType = 0;
    var debit = 0;
    var credit = 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    for (final msg in messages) {
      totalScanned++;
      final body = msg.body ?? '';
      if (body.isEmpty) continue;

      final found = _extractLast4(body);
      if (found == null) continue;
      if (found != target) {
        mismatch++;
        continue;
      }
      last4Matched++;

      final rawAmount = _amount.firstMatch(body)?.group(1);
      final amount = rawAmount == null
          ? null
          : double.tryParse(rawAmount.replaceAll(',', ''));
      if (amount == null) {
        noAmount++;
        continue;
      }

      final isDebit = _debit.hasMatch(body);
      final isCredit = _credit.hasMatch(body);
      final String type;
      if (isDebit && !isCredit) {
        type = 'DEBIT';
      } else if (isCredit && !isDebit) {
        type = 'CREDIT';
      } else if (isDebit) {
        type = 'DEBIT';
      } else {
        noType++;
        continue;
      }

      if (type == 'DEBIT') {
        debit++;
      } else {
        credit++;
      }

      final merchant =
          _merchant.firstMatch(body)?.group(1)?.trim().toUpperCase() ?? 'UNKNOWN';
      final date = _date.firstMatch(body)?.group(1) ??
          (msg.date != null
              ? '${msg.date!.day.toString().padLeft(2, '0')}/${msg.date!.month.toString().padLeft(2, '0')}/${msg.date!.year}'
              : 'Unknown');
      final time = _time.firstMatch(body)?.group(1) ??
          (msg.date != null
              ? '${msg.date!.hour.toString().padLeft(2, '0')}:${msg.date!.minute.toString().padLeft(2, '0')}'
              : '');
      final balRaw = _balance.firstMatch(body)?.group(1);
      final balance = balRaw == null ? null : '₹${balRaw.replaceAll(',', '')}';

      results.add(TransactionEntity(
        cardId: cardId,
        amount: amount,
        type: type,
        merchant: merchant,
        date: date,
        time: time,
        rawSms: body,
        cardLastFour: found,
        availableBalance: balance,
        fetchedAt: now,
      ));

      if (results.length >= limit) break;
    }

    return SmsScanResult(
      results,
      SmsScanStats(
        totalScanned: totalScanned,
        last4Matched: last4Matched,
        cardFoundButMismatch: mismatch,
        noAmount: noAmount,
        noType: noType,
        debit: debit,
        credit: credit,
      ),
    );
  }
}
