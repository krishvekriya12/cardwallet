import 'dart:async';

import '../../../core/database/app_database.dart';
import '../domain/transaction_entity.dart';

/// Local persistence + reactive per-card stream for parsed transactions.
class TransactionRepository {
  final _controllers = <int, StreamController<List<TransactionEntity>>>{};
  final _cache = <int, List<TransactionEntity>>{};

  StreamController<List<TransactionEntity>> _controllerFor(int cardId) {
    return _controllers.putIfAbsent(
      cardId,
      () => StreamController<List<TransactionEntity>>.broadcast(),
    );
  }

  Stream<List<TransactionEntity>> watchForCard(int cardId) {
    final controller = _controllerFor(cardId);
    if (_cache.containsKey(cardId)) {
      Future.microtask(() => controller.add(_cache[cardId]!));
    } else {
      _refresh(cardId);
    }
    return controller.stream;
  }

  Future<List<TransactionEntity>> getForCardOnce(int cardId) async {
    final db = await AppDatabase.instance.db;
    final maps = await db.query(
      'transactions',
      where: 'cardId = ?',
      whereArgs: [cardId],
      orderBy: 'fetchedAt DESC, id DESC',
    );
    return maps.map(TransactionEntity.fromMap).toList();
  }

  Future<void> _refresh(int cardId) async {
    final list = await getForCardOnce(cardId);
    _cache[cardId] = list;
    _controllerFor(cardId).add(list);
  }

  /// Inserts only the transactions not already stored for the card. Returns the
  /// number of newly inserted rows.
  Future<int> insertNew(int cardId, List<TransactionEntity> parsed) async {
    final db = await AppDatabase.instance.db;
    final existing = await getForCardOnce(cardId);
    var inserted = 0;
    final allTx = List<TransactionEntity>.from(existing);
    for (final tx in parsed) {
      final dup = allTx.any((e) => e.sameAs(tx));
      if (dup) continue;
      await db.insert('transactions', tx.toMap());
      allTx.add(tx);
      inserted++;
    }
    if (inserted > 0) await _refresh(cardId);
    return inserted;
  }

  Future<void> clearForCard(int cardId) async {
    final db = await AppDatabase.instance.db;
    await db.delete('transactions', where: 'cardId = ?', whereArgs: [cardId]);
    await _refresh(cardId);
  }

  void dispose() {
    for (final c in _controllers.values) {
      c.close();
    }
    _controllers.clear();
  }
}
