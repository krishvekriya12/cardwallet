import 'dart:async';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/repositories/card_repository.dart';
import '../datasources/card_local_datasource.dart';
import '../models/card_model.dart';

class CardRepositoryImpl implements CardRepository {
  final CardLocalDataSource localDataSource;

  CardRepositoryImpl(this.localDataSource);

  final _cardsController = StreamController<List<CardEntity>>.broadcast();
  List<CardEntity>? _lastCards;

  @override
  Stream<List<CardEntity>> watchAllCards() {
    if (_lastCards != null) {
      Future.microtask(() => _cardsController.add(_lastCards!));
    } else {
      _refreshCards();
    }
    return _cardsController.stream;
  }

  @override
  Stream<CardEntity?> watchCardById(int id) {
    return watchAllCards().map((cards) {
      for (final card in cards) {
        if (card.id == id) return card;
      }
      return null;
    });
  }

  Future<void> _refreshCards() async {
    final cards = await localDataSource.getAllCards();
    _lastCards = cards;
    _cardsController.add(cards);
  }

  @override
  Future<CardEntity?> getCardById(int id) => localDataSource.getCardById(id);

  @override
  Future<List<CardEntity>> getAllCardsOnce() => localDataSource.getAllCards();

  @override
  Future<int> insertCard(CardEntity card) async {
    final id = await localDataSource.insertCard(CardModel.fromEntity(card));
    await _refreshCards();
    return id;
  }

  @override
  Future<void> updateCard(CardEntity card) async {
    await localDataSource.updateCard(CardModel.fromEntity(card));
    await _refreshCards();
  }

  @override
  Future<void> deleteCardById(int id) async {
    await localDataSource.deleteCardById(id);
    await _refreshCards();
  }

  @override
  Future<void> wipeAllData() async {
    await AppDatabase.instance.wipeAllData();
    await _refreshCards();
  }
}
