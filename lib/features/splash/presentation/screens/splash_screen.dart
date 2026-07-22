// ============================================================
// splash_screen.dart — Animated App Launch Screen
// ============================================================
//
// 📚 FLUTTER CONCEPT: flutter_animate package
//
// flutter_animate ek powerful animation library hai.
// Isme animations method chaining se add karte hain:
//
//   Widget().animate()
//     .fadeIn(duration: 300.ms)    ← fade in karo
//     .scale(begin: Offset(0.7, 0.7)) ← scale up karo
//     .slideY(begin: 0.3)          ← neeche se upar
//
// Multiple animations PARALLEL chalti hain by default.
// .then() se SEQUENTIAL bana sakte ho.
//
// 📚 FLUTTER CONCEPT: Curves
//
// Animation ka speed pattern = Curve
// Curves.linear        = same speed throughout
// Curves.easeOut       = fast start, slow end (natural)
// Curves.easeOutBack   = overshoot phir settle (spring feel)
// Curves.elasticOut    = bounce jaisa
//
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/ads/app_open_ad_helper.dart';
import '../../../../core/ads/interstitial_ad_manager.dart';
import '../../../../core/security/lock_providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Typewriter effect ke liye
  // 📚 String ki list se ek ek character add karte hain
  String _fullTitle = '';
  String _displayTitle = '';
  int _charIndex = 0;
  bool _cursorVisible = true;

  // Typewriter timer
  // 📚 Future.delayed() = delay ke baad code chalao (async)
  bool _mounted = true;

  @override
  void initState() {
    super.initState();
    AppOpenAdHelper.disableAd();
    _startCursorBlink();
    _scheduleNavigation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fullTitle.isEmpty) {
      _fullTitle = AppLocalizations.of(context)!.appTitleTypewriter;
      _startTypewriter();
    }
  }

  void _startTypewriter() async {
    await Future.delayed(const Duration(milliseconds: 600));
    while (_mounted && _charIndex < _fullTitle.length) {
      await Future.delayed(const Duration(milliseconds: 80));
      if (!_mounted) return;
      setState(() {
        _charIndex++;
        _displayTitle = _fullTitle.substring(0, _charIndex);
      });
    }
  }

  void _startCursorBlink() async {
    while (_mounted) {
      await Future.delayed(const Duration(milliseconds: 400));
      if (!_mounted) return;
      setState(() => _cursorVisible = !_cursorVisible);
    }
  }

  void _scheduleNavigation() {
    final router = GoRouter.of(context);

    Future.delayed(const Duration(milliseconds: 1800), () async {
      if (!_mounted || !mounted) return;

      int waitTime = 0;
      while (!InterstitialAdManager.instance.isAdReady() && waitTime < 3000) {
        await Future.delayed(const Duration(milliseconds: 150));
        waitTime += 150;
        if (!_mounted || !mounted) return;
      }

      if (!_mounted || !mounted) return;

      InterstitialAdManager.instance.showAfterSplash(
        context: context,
        onComplete: () {
          if (!_mounted) return;
          ref.read(splashActiveProvider.notifier).setFinished();
          AppOpenAdHelper.enableAd();
          router.go('/home');
        },
      );
    });
  }

  @override
  void dispose() {
    _mounted = false; // Sab loops rok do
    super.dispose();
  }

  // ─────────────────────────────────────────────────────────
  // Build
  // ─────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final size = MediaQuery.sizeOf(context); // Screen size

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),

              // ── App Icon ────────────────────────────────────
              _buildIcon(c)
                  .animate()
                  .scale(
                    begin: const Offset(0.6, 0.6),
                    end: const Offset(1.0, 1.0),
                    duration: Duration(milliseconds: AppDim.mediumMs),
                    curve: Curves.easeOutBack,
                  )
                  .fadeIn(
                    duration: Duration(milliseconds: AppDim.standardMs),
                  ),

              const SizedBox(height: AppDim.s28),

              // ── Title with Typewriter ──────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    _displayTitle,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _cursorVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      width: 3,
                      height: 30,
                      margin: const EdgeInsets.only(
                          left: AppDim.s4, bottom: AppDim.s2),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.8),
                        borderRadius:
                            BorderRadius.circular(AppDim.rFull),
                      ),
                    ),
                  ),
                ],
              )
                  .animate(delay: Duration(milliseconds: 350))
                  .fadeIn(duration: Duration(milliseconds: AppDim.standardMs))
                  .slideY(
                    begin: 0.25,
                    end: 0,
                    curve: Curves.easeOutCubic,
                    duration: Duration(milliseconds: AppDim.slowMs),
                  ),

              const SizedBox(height: AppDim.s12),

              // ── Subtitle ──────────────────────────────────
              Text(
                AppLocalizations.of(context)!.splashSubtitle,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.white.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              )
                  .animate(delay: Duration(milliseconds: 600))
                  .fadeIn(duration: Duration(milliseconds: AppDim.slowMs)),

              const Spacer(),

              // ── Bottom Loader & Contains Ads ─────────────
              _buildBottomLoaderSection(),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  // ── App Icon Widget ────────────────────────────────────────
  Widget _buildIcon(AppPalette c) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.25),
            blurRadius: 40,
            offset: const Offset(0, 16),
            spreadRadius: -8,
          ),
          BoxShadow(
            color: AppColors.primaryLight.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.credit_card_rounded,
        color: AppColors.primary,
        size: 48,
      ),
    );
  }

  // ── Bottom Loader & Contains Ads Widget ─────────────────────
  Widget _buildBottomLoaderSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 22,
          height: 22,
          child: ExpressiveLoadingIndicator(
            color: AppColors.white,
            constraints: BoxConstraints.tightFor(width: 22, height: 22),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Contains ads',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: AppColors.white.withValues(alpha: 0.75),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
          ),
        ),
      ],
    )
        .animate(delay: const Duration(milliseconds: 700))
        .fadeIn(duration: const Duration(milliseconds: 400));
  }
}
