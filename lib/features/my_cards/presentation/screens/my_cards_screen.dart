import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/segmented_filter_chips.dart';
import '../../../cards/domain/entities/card_entity.dart';
import '../../../cards/domain/entities/card_type.dart';
import '../../../cards/presentation/providers/card_providers.dart';
import '../widgets/saved_card_item.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class MyCardsScreen extends ConsumerStatefulWidget {
  const MyCardsScreen({super.key});

  @override
  ConsumerState<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends ConsumerState<MyCardsScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final asyncCards = ref.watch(allCardsProvider);

    return Scaffold(
      backgroundColor: c.page,
      body: asyncCards.when(
        data: (cards) => _buildContent(context, cards),
        loading: () => Center(
          child: ExpressiveLoadingIndicator(
            color: c.primary,
            constraints: const BoxConstraints.tightFor(width: 36, height: 36),
          ),
        ),
        error: (e, st) =>
            Center(child: Text('$e', style: TextStyle(color: c.error))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<CardEntity> allCards) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;

    final filters = <FilterChipData>[
      FilterChipData(label: l10n.allFilter, count: allCards.length),
      for (final type in CardType.values)
        FilterChipData(
          label: type.getLocalizedLabel(context),
          count: allCards.where((card) => card.cardType == type.label).length,
        ),
    ];

    final filtered = _selectedFilter == 0
        ? allCards
        : allCards
            .where((card) =>
                card.cardType == CardType.values[_selectedFilter - 1].label)
            .toList();

    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.cardsTitle,
                        style: TextStyle(
                          color: c.textPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        allCards.isEmpty
                            ? l10n.yourCardsManage
                            : l10n.cardCountText(allCards.length),
                        style:
                            TextStyle(color: c.textSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 300.ms),
          ),

          const SizedBox(height: 16),
          if (allCards.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SegmentedFilterChips(
                items: filters,
                selectedIndex: _selectedFilter,
                onSelected: (i) => setState(() => _selectedFilter = i),
              ).animate().fadeIn(delay: 60.ms, duration: 300.ms),
            ),
            const SizedBox(height: 14),
          ],
          Expanded(
            child: filtered.isEmpty && allCards.isNotEmpty
                ? const _FilterEmptyState()
                : allCards.isEmpty
                    ? const _EmptyState()
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                        itemCount: filtered.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final card = filtered[index];
                          return SavedCardItem(
                            card: card,
                            onTap: () => context.push('/card/${card.id}'),
                          )
                              .animate()
                              .fadeIn(
                                delay: Duration(milliseconds: 60 + index * 50),
                                duration: 350.ms,
                              )
                              .slideY(begin: 0.08, end: 0);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration:
                BoxDecoration(color: c.primarySoft, shape: BoxShape.circle),
            child:
                Icon(Icons.credit_card_off_rounded, size: 38, color: c.primary),
          )
              .animate(onPlay: (ctrl) => ctrl.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.06, 1.06),
                duration: 1100.ms,
                curve: Curves.easeInOut,
              ),
          const SizedBox(height: 20),
          Text(
            l10n.noCardsYet,
            style: TextStyle(
              color: c.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.noCardsYetDesc,
            style: TextStyle(color: c.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _FilterEmptyState extends StatelessWidget {
  const _FilterEmptyState();
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.filter_list_off_rounded, size: 48, color: c.textMuted),
          const SizedBox(height: 16),
          Text(
            l10n.noCardsCategory,
            style: TextStyle(
              color: c.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.tryDifferentFilter,
            style: TextStyle(color: c.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
