import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/card_local_datasource.dart';
import '../../data/repositories/card_repository_impl.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/repositories/card_repository.dart';

final cardLocalDataSourceProvider = Provider<CardLocalDataSource>((ref) {
  return CardLocalDataSource();
});

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return CardRepositoryImpl(ref.watch(cardLocalDataSourceProvider));
});

final allCardsProvider = StreamProvider<List<CardEntity>>((ref) {
  return ref.watch(cardRepositoryProvider).watchAllCards();
});

final cardByIdProvider = StreamProvider.family<CardEntity?, int>((ref, id) {
  return ref.watch(cardRepositoryProvider).watchCardById(id);
});

class CardActions {
  final Ref ref;

  CardActions(this.ref);

  Future<int> insertCard(CardEntity card) {
    return ref.read(cardRepositoryProvider).insertCard(card);
  }

  Future<void> updateCard(CardEntity card) {
    return ref.read(cardRepositoryProvider).updateCard(card);
  }

  Future<void> deleteCard(int id) {
    return ref.read(cardRepositoryProvider).deleteCardById(id);
  }

  Future<void> wipeAllData() {
    return ref.read(cardRepositoryProvider).wipeAllData();
  }

  /// Whether another saved card already has this exact number (digits
  /// only), excluding [excludeId] (the card currently being edited, if
  /// any).
  Future<bool> numberExists(String number, {int? excludeId}) async {
    final digits = number.replaceAll(RegExp(r'\D'), '');
    final cards = await ref.read(cardRepositoryProvider).getAllCardsOnce();
    return cards.any(
      (c) =>
          c.id != excludeId &&
          c.cardNumber.replaceAll(RegExp(r'\D'), '') == digits,
    );
  }
}

final cardActionsProvider = Provider<CardActions>((ref) => CardActions(ref));
