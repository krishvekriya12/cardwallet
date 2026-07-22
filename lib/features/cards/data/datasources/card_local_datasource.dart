import 'package:cardwallet/core/database/app_database.dart';
import 'package:cardwallet/features/cards/data/models/card_model.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class CardLocalDataSource {
  Future<List<CardModel>> getAllCards() async {
    final db = await AppDatabase.instance.db;
    final maps = await db.query(
      'cards',
      orderBy: 'position ASC, createdAt DESC',
    );
    return maps.map((m) => CardModel.fromMap(m)).toList();
  }

  Future<CardModel?> getCardById(int id) async {
    final db = await AppDatabase.instance.db;
    final maps = await db.query('cards', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) return null;
    return CardModel.fromMap(maps.first);
  }

  Future<int> insertCard(CardModel card) async {
    final db = await AppDatabase.instance.db;
    return db.insert(
      'cards',
      card.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateCard(CardModel card) async {
    final db = await AppDatabase.instance.db;
    await db.update(
      'cards',
      card.toMap(),
      where: 'id = ?',
      whereArgs: [card.id],
    );
  }

  Future<void> deleteCardById(int id) async {
    final db = await AppDatabase.instance.db;
    await db.delete('cards', where: 'id = ?', whereArgs: [id]);
  }
}
