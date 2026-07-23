import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/animated_press_scale.dart';

import '../../../cards/domain/entities/card_type.dart';
import '../../../cards/presentation/providers/card_providers.dart';
import '../../../cards/presentation/screens/add_card_screen.dart';
import '../../../profile/presentation/providers/profile_providers.dart';
import '../../../../l10n/genrated/app_localizations.dart';
import '../../domain/frequent_brand.dart';
import '../widgets/brand_grid_item.dart';
import '../widgets/home_card_carousel.dart';
import '../widgets/quick_action_card.dart';

void _addManually(BuildContext context) {
  context.push(
      '/add-card', extra: const AddCardArgs(initialType: CardType.credit));
}

String _greeting(BuildContext context) {
  final hour = DateTime.now().hour;
  final l10n = AppLocalizations.of(context)!;
  if (hour < 12) return l10n.goodMorning;
  if (hour < 17) return l10n.goodAfternoon;
  return l10n.goodEvening;
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final cardsAsync = ref.watch(allCardsProvider);
    final profile = ref.watch(profileProvider);
    final cardCount = cardsAsync.value?.length ?? cardsAsync.asData?.value.length ?? 0;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 8),
            _Header(
              name: profile.name,
              photoPath: profile.photoPath,
              count: cardCount,
            )
                .animate()
                .fadeIn(duration: 350.ms)
                .slideY(begin: -0.15, end: 0, curve: Curves.easeOutCubic),
            const SizedBox(height: 4),
            cardsAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (e, st) => const SizedBox.shrink(),
              data: (cards) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: cards.isEmpty
                    ? const SizedBox.shrink(key: ValueKey('empty'))
                    : Column(
                        key: const ValueKey('carousel'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: HomeCardCarousel(
                              cards: cards,
                              onCardTap: (card) => context.push('/card/${card.id}'),
                            ),
                          ),
                          const SizedBox(height: 28),
                        ],
                      ),
              ),
            ),
            _SectionLabel(title: l10n.addNewCard),
            const SizedBox(height: 14),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _QuickAddButton(
                      icon: Icons.qr_code_scanner_rounded,
                      title: l10n.scan,
                      description: l10n.scanDesc,
                      accentColor: c.primary,
                      onTap: () => context.push('/card-scan'),
                    ),
                    const SizedBox(width: 10),
                    _QuickAddButton(
                      icon: Icons.add_card_rounded,
                      title: l10n.manually,
                      description: l10n.manuallyDesc,
                      accentColor: c.success,
                      onTap: () => _addManually(context),
                    ),
                    const SizedBox(width: 10),
                    _QuickAddButton(
                      icon: Icons.contactless_outlined,
                      title: l10n.nfc,
                      description: l10n.nfcDesc,
                      accentColor: c.info,
                      onTap: () => context.push('/nfc-reader'),
                    ),
                  ],
                ),
              ),
            ).animate(delay: 120.ms).fadeIn(duration: 350.ms).slideY(
                begin: 0.2, end: 0),
            const SizedBox(height: 28),
            _SectionLabel(title: l10n.tools),
            const SizedBox(height: 14),
            _ActionListGroup(
              items: [
                _ActionListItem(
                  icon: Icons.search_rounded,
                  title: l10n.binChecker,
                  description: l10n.binCheckerDesc,
                  onTap: () => context.push('/bin-checker'),
                  accentColor: c.warning,
                ),
                _ActionListItem(
                  icon: Icons.verified_outlined,
                  title: l10n.cardVerify,
                  description: l10n.cardVerifyDesc,
                  onTap: () => context.push('/card-validator'),
                  accentColor: c.success,
                ),
              ],
            ).animate(delay: 200.ms).fadeIn(duration: 350.ms).slideY(
                begin: 0.2, end: 0),
            const SizedBox(height: 28),
            _SectionLabel(title: l10n.frequentlyAdded),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: frequentBrands.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 10,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                final brand = frequentBrands[index];
                return BrandGridItem(
                  asset: brand.asset,
                  name: brand.name,
                  onTap: () => context.push(
                    '/add-card',
                    extra: AddCardArgs(
                      initialType: CardType.other,
                      brandName: brand.name,
                    ),
                  ),
                )
                    .animate(delay: (260 + index * 30).ms)
                    .fadeIn(duration: 300.ms)
                    .scale(
                      begin: const Offset(0.85, 0.85),
                      end: const Offset(1, 1),
                      curve: Curves.easeOutBack,
                    );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String name;
  final String? photoPath;
  final int count;

  const _Header({
    required this.name,
    required this.photoPath,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final greeting = name.trim().isEmpty 
        ? l10n.hiThere 
        : l10n.hiName(name.trim().split(' ').first);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: TextStyle(
                    fontSize: 13,
                    color: c.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                _TypewriterText(
                  text: _greeting(context),
                  duration: const Duration(milliseconds: 1000),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: c.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: GestureDetector(
              onTap: () {
                try {
                  StatefulNavigationShell.of(context).goBranch(1);
                } catch (_) {
                  context.go('/my-cards');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                decoration: BoxDecoration(
                  color: c.primarySoft,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.style_rounded, size: 16, color: c.primary),
                    const SizedBox(width: 6),
                    Text(
                      l10n.cardCountBadge(count),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: c.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const _TypewriterText({
    required this.text,
    required this.style,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<_TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<_TypewriterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<int> _charCount;
  late Characters _characters;

  @override
  void initState() {
    super.initState();
    _characters = widget.text.characters;
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _charCount = StepTween(begin: 0, end: _characters.length).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _characters = widget.text.characters;
      _controller.duration = widget.duration;
      _charCount = StepTween(begin: 0, end: _characters.length).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _charCount,
      builder: (context, child) {
        final currentText = _characters.take(_charCount.value).toString();
        final showCursor = _controller.isAnimating || _charCount.value < _characters.length;
        return Text.rich(
          TextSpan(
            text: currentText,
            style: widget.style,
            children: [
              if (showCursor)
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: _TypingCursor(
                      height: widget.style.fontSize ?? 24,
                      color: widget.style.color,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TypingCursor extends StatefulWidget {
  final double height;
  final Color? color;

  const _TypingCursor({required this.height, this.color});

  @override
  State<_TypingCursor> createState() => _TypingCursorState();
}

class _TypingCursorState extends State<_TypingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 3.0,
        height: widget.height * 0.9,
        margin: const EdgeInsets.only(left: 4),
        decoration: BoxDecoration(
          color: widget.color ?? Colors.black,
          borderRadius: BorderRadius.circular(1.5),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;

  const _SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: c.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.2,
                color: c.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final Color accentColor;

  const _QuickAddButton({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;
    final accent = accentColor;
    final cardBg = isDark ? c.surface : Colors.white;

    return Expanded(
      child: AnimatedPressScale(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.06),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: c.shadow.withValues(alpha: isDark ? 0.08 : 0.03),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: isDark ? 0.18 : 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: accent,
                  size: 21,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700,
                  color: c.textPrimary,
                  letterSpacing: -0.1,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                height: 14,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: c.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionListGroup extends StatelessWidget {
  final List<_ActionListItem> items;

  const _ActionListGroup({required this.items});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;
    final cardBg = isDark ? c.surface : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.06),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: c.shadow.withValues(alpha: isDark ? 0.08 : 0.03),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            for (int i = 0; i < items.length; i++) ...[
              if (i > 0)
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 68,
                  endIndent: 16,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.06)
                      : Colors.black.withValues(alpha: 0.05),
                ),
              _ActionListTile(item: items[i]),
            ],
          ],
        ),
      ),
    );
  }
}

class _ActionListItem {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final Color accentColor;

  const _ActionListItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.accentColor,
  });
}

class _ActionListTile extends StatelessWidget {
  final _ActionListItem item;

  const _ActionListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;
    final accent = item.accentColor;

    return AnimatedPressScale(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // Solid rounded icon badge
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: isDark ? 0.16 : 0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item.icon,
                color: accent,
                size: 21,
              ),
            ),
            const SizedBox(width: 14),
            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: c.textPrimary,
                      letterSpacing: -0.1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: c.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Trailing Chevron
            Icon(
              Icons.chevron_right_rounded,
              color: c.textTertiary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}


