import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/transaction_repository.dart';
import '../../domain/transaction_entity.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final repo = TransactionRepository();
  ref.onDispose(repo.dispose);
  return repo;
});

final transactionsForCardProvider =
    StreamProvider.family<List<TransactionEntity>, int>((ref, cardId) {
  return ref.watch(transactionRepositoryProvider).watchForCard(cardId);
});
