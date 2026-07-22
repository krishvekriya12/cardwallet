import 'package:cardwallet/features/cards/domain/entities/card_entity.dart';

abstract class CardRepository {
  Stream<List<CardEntity>> watchAllCards();

  Stream<CardEntity?> watchCardById(int id);

  Future<CardEntity?> getCardById(int id);

  Future<List<CardEntity>> getAllCardsOnce();

  Future<int> insertCard(CardEntity card);

  Future<void> updateCard(CardEntity card);

  Future<void> deleteCardById(int id);

  Future<void> wipeAllData();
}
