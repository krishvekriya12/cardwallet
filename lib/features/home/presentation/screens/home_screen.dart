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

    final width = MediaQuery.of(context).size.width;
    final cardWidth = width - 40;
    final cardHeight = cardWidth / 1.586;
    final carouselHeight = cardHeight + 40.0;

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
            const SizedBox(height: 28),
            cardsAsync.when(
              loading: () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _CardLoadingPlaceholder(height: carouselHeight),
              ),
              error: (e, st) => const SizedBox.shrink(),
              data: (cards) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: cards.isEmpty
                     ? Padding(
                        key: const ValueKey('empty'),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _EmptyCardHint(height: carouselHeight),
                      )
                    : Padding(
                        key: const ValueKey('carousel'),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HomeCardCarousel(
                          cards: cards,
                          onCardTap: (card) => context.push('/card/${card.id}'),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 28),
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
                      onTap: () => context.push('/card-scan'),
                      accentColor: c.primary,
                    ),
                    const SizedBox(width: 10),
                    _QuickAddButton(
                      icon: Icons.add_card_rounded,
                      title: l10n.manually,
                      description: l10n.manuallyDesc,
                      onTap: () => _addManually(context),
                      accentColor: c.success,
                    ),
                    const SizedBox(width: 10),
                    _QuickAddButton(
                      icon: Icons.contactless_outlined,
                      title: l10n.nfc,
                      description: l10n.nfcDesc,
                      onTap: () => context.push('/nfc-reader'),
                      accentColor: c.info,
                      iconSize: 31.0,
                    ),
                  ],
                ),
              ),
            ).animate(delay: 120.ms).fadeIn(duration: 350.ms).slideY(
                begin: 0.2, end: 0),
            const SizedBox(height: 28),
            _SectionLabel(title: l10n.tools),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: QuickActionCard(
                        icon: Icons.search_rounded,
                        title: l10n.binChecker,
                        description: l10n.binCheckerDesc,
                        onTap: () => context.push('/bin-checker'),
                        accentColor: c.warning,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: QuickActionCard(
                        icon: Icons.verified_outlined,
                        title: l10n.cardVerify,
                        description: l10n.cardVerifyDesc,
                        onTap: () => context.push('/card-validator'),
                        accentColor: c.success,
                      ),
                    ),
                  ],
                ),
              ),
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
                fontSize: 17,
                fontWeight: FontWeight.w800,
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
  final double iconSize;

  const _QuickAddButton({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.accentColor,
    this.iconSize = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;
    final accent = accentColor;

    final cardGradient = null;

    final cardBgColor = isDark ? c.surface : Colors.white;

    final titleColor = isDark
        ? Colors.white.withValues(alpha: 0.95)
        : accent;

    final width = MediaQuery.of(context).size.width;
    final buttonWidth = (width - 40 - 20) / 3;

    return Expanded(
      child: AnimatedPressScale(
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(minHeight: buttonWidth),
          decoration: BoxDecoration(
            color: cardBgColor,
            gradient: cardGradient,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.07),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: c.shadow.withValues(alpha: isDark ? 0.08 : 0.04),
                blurRadius: 16,
                spreadRadius: -2,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.02),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Solid colored action icon container (white icon)
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isDark ? accent.withValues(alpha: 0.15) : accent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: isDark ? accent : Colors.white,
                    size: iconSize,
                  ),
                ),

                const SizedBox(height: 10),

                // Title Text (centered, consistent size)
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyCardHint extends StatelessWidget {
  final double? height;
  const _EmptyCardHint({this.height});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: height,
      constraints: const BoxConstraints(minHeight: 190),
      width: double.infinity,
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: c.primary.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: c.primarySoft,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add_card_rounded,
              color: c.primary,
              size: 28,
            ),
          )
              .animate(onPlay: (ctrl) => ctrl.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.1, 1.1),
                duration: 900.ms,
                curve: Curves.easeInOut,
              ),
          const SizedBox(height: 12),
          Text(
            l10n.noCardsYet,
            style: TextStyle(
              color: c.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.addFirstCardStart,
            style: TextStyle(color: c.textSecondary, fontSize: 12),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic);
  }
}

class _CardLoadingPlaceholder extends StatelessWidget {
  final double? height;
  const _CardLoadingPlaceholder({this.height});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;

    final cardBg = c.surface;
    final borderColor = c.border;

    // Compartment bar colors (should contrast with cardBg)
    final barColor = isDark ? Colors.white.withValues(alpha: 0.10) : Colors.black.withValues(alpha: 0.08);

    // Shimmer highlight color (bright contrasting sweep)
    final shimmerColor = isDark ? Colors.white.withValues(alpha: 0.18) : Colors.white.withValues(alpha: 0.85);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AspectRatio(
          aspectRatio: 1.586,
          child: Container(
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: borderColor, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: c.shadow.withValues(alpha: isDark ? 0.10 : 0.04),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Card Type and Bank Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _staticBar(width: 75, height: 13, color: barColor),
                    _staticBar(width: 90, height: 13, color: barColor),
                  ],
                ),
                const Spacer(flex: 3),
                // Chip
                _staticBar(width: 42, height: 26, radius: 6, color: barColor),
                const Spacer(flex: 4),
                // Card Number
                _staticBar(width: 210, height: 20, color: barColor),
                const Spacer(flex: 7),
                // Bottom Row: Holder name and Network Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _staticBar(width: 130, height: 13, color: barColor),
                        const SizedBox(height: 5),
                        _staticBar(width: 65, height: 10, color: barColor),
                      ],
                    ),
                    _staticBar(width: 38, height: 24, radius: 4, color: barColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate(onPlay: (ctrl) => ctrl.repeat())
        .shimmer(
          duration: 1350.ms,
          color: shimmerColor,
          angle: 0.5,
        );
  }

  Widget _staticBar({
    required double width,
    required double height,
    double radius = 4.0,
    required Color color,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
