import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../l10n/genrated/app_localizations.dart';

class _BottomTab {
  final IconData activeIcon;
  final IconData inactiveIcon;

  const _BottomTab({
    required this.activeIcon,
    required this.inactiveIcon,
  });
}

const _tabs = [
  _BottomTab(
    activeIcon: Icons.home_rounded,
    inactiveIcon: Icons.home_outlined,
  ),
  _BottomTab(
    activeIcon: Icons.credit_card_rounded,
    inactiveIcon: Icons.credit_card_outlined,
  ),
  _BottomTab(
    activeIcon: Icons.person_rounded,
    inactiveIcon: Icons.person_outline_rounded,
  ),
];
class AppBottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar>
    with TickerProviderStateMixin {
  late final AnimationController _entryController;
  late final List<AnimationController> _scaleControllers;

  @override
  void initState() {
    super.initState();
    _entryController = AnimationController(
      vsync: this,
      duration: AppDim.slow,
    )..forward();

    _scaleControllers = List.generate(
      _tabs.length,
      (_) => AnimationController(
        vsync: this,
        duration: AppDim.micro,
        lowerBound: 0.85,
        upperBound: 1.0,
      )..value = 1.0,
    );
  }

  @override
  void didUpdateWidget(AppBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _animateTabBounce(widget.currentIndex);
    }
  }

  Future<void> _animateTabBounce(int index) async {
    final ctrl = _scaleControllers[index];
    await ctrl.reverse();
    await ctrl.forward();
  }

  void _onTabTap(int index) {
    HapticFeedback.selectionClick();
    widget.onTap(index);
  }

  @override
  void dispose() {
    _entryController.dispose();
    for (final ctrl in _scaleControllers) {
      ctrl.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _entryController,
      builder: (context, child) {
        final slideValue = CurvedAnimation(
          parent: _entryController,
          curve: Curves.easeOutCubic,
        ).value;
        return Transform.translate(
          offset: Offset(0, (1 - slideValue) * 100),
          child: child,
        );
      },
      child: _buildBar(isDark),
    );
  }

  Widget _buildBar(bool isDark) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDim.s16,
          0,
          AppDim.s16,
          AppDim.s12,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDim.rXL),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: AppDim.bottomNavHeight,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkSurface.withValues(alpha: 0.85)
                    : AppColors.lightSurface.withValues(alpha: 0.90),
                borderRadius: BorderRadius.circular(AppDim.rXL),
                border: Border.all(
                  color: isDark
                      ? AppColors.glassBorder
                      : AppColors.lightBorder.withValues(alpha: 0.8),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.15)
                        : AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: List.generate(
                  _tabs.length,
                  (i) => _buildTabItem(i, isDark),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  String _getTabLabel(BuildContext context, int index) {
    final l10n = AppLocalizations.of(context)!;
    switch (index) {
      case 0:
        return l10n.homeTab;
      case 1:
        return l10n.cardsTab;
      case 2:
        return l10n.profileTab;
      default:
        return '';
    }
  }

  Widget _buildTabItem(int index, bool isDark) {
    final isActive = widget.currentIndex == index;
    final tab = _tabs[index];
    final label = _getTabLabel(context, index);
    final activeColor = AppColors.primary;
    final inactiveColor = isDark
        ? AppColors.darkTextTertiary
        : AppColors.lightTextTertiary;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabTap(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedBuilder(
          animation: _scaleControllers[index],
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleControllers[index].value,
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated pill behind active icon
              AnimatedContainer(
                duration: AppDim.fast,
                curve: Curves.easeOutCubic,
                width: isActive ? 52 : 36,
                height: 34,
                decoration: BoxDecoration(
                  color: isActive
                      ? activeColor.withValues(alpha: isDark ? 0.18 : 0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: AnimatedSwitcher(
                  duration: AppDim.fast,
                  child: Icon(
                    isActive ? tab.activeIcon : tab.inactiveIcon,
                    key: ValueKey(isActive),
                    size: isActive ? 26 : 24,
                    color: isActive ? activeColor : inactiveColor,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              AnimatedDefaultTextStyle(
                duration: AppDim.fast,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive ? activeColor : inactiveColor,
                ),
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
