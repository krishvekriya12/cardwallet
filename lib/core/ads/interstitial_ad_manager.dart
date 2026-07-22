import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_ids.dart';
import 'ad_loading_overlay.dart';
import 'interstitial_ad_counter.dart';

import '../router/app_router.dart';

class InterstitialAdManager {
  InterstitialAdManager._();
  static final InterstitialAdManager instance = InterstitialAdManager._();

  InterstitialAd? _ad;
  bool _isLoading = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;

  bool adsDisabled = false;
  static bool isFullScreenAdShowing = false;
  static int lastAdDismissedTime = 0;

  void loadAd() {
    if (adsDisabled || _ad != null || _isLoading) return;

    _isLoading = true;
    InterstitialAd.load(
      adUnitId: AdIds.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (adsDisabled) {
            ad.dispose();
            _ad = null;
            _isLoading = false;
            return;
          }
          _ad = ad;
          _isLoading = false;
          _retryCount = 0;
          debugPrint('InterstitialAd loaded successfully ✅');
        },
        onAdFailedToLoad: (error) {
          _ad = null;
          _isLoading = false;
          debugPrint('InterstitialAd failed to load: ${error.message}');

          if (_retryCount < _maxRetries) {
            _retryCount++;
            final delayMs = 2000 * _retryCount;
            Future.delayed(Duration(milliseconds: delayMs), () {
              loadAd();
            });
          }
        },
      ),
    );
  }

  bool isAdReady() => _ad != null;

  void clearAd() {
    _ad?.dispose();
    _ad = null;
    _isLoading = false;
  }

  Future<void> showAd({
    BuildContext? context,
    bool showLoader = true,
    int loaderDelayMs = 600,
    required VoidCallback onAdClosed,
  }) async {
    debugPrint('InterstitialAdManager.showAd called, ad ready: ${_ad != null}');

    if (adsDisabled) {
      debugPrint('InterstitialAdManager: Ads disabled');
      onAdClosed();
      return;
    }

    final targetContext = context ?? rootNavigatorKey.currentContext;
    final stopwatch = Stopwatch()..start();

    if (showLoader && targetContext != null && targetContext.mounted) {
      AdLoadingOverlay.show(
        context: targetContext,
        isWhiteBackground: false,
        message: 'loading ads ...',
      );
    }

    if (_ad == null) {
      debugPrint('InterstitialAdManager: Ad not ready yet, loading with loader active...');
      loadAd();

      int waitedMs = 0;
      final maxWait = loaderDelayMs > 4000 ? loaderDelayMs : 4000;
      while (_ad == null && _isLoading && waitedMs < maxWait) {
        await Future.delayed(const Duration(milliseconds: 100));
        waitedMs += 100;
      }
    }

    if (showLoader && _ad != null) {
      final elapsedMs = stopwatch.elapsedMilliseconds;
      if (elapsedMs < loaderDelayMs) {
        await Future.delayed(Duration(milliseconds: loaderDelayMs - elapsedMs));
      }
    }

    final ad = _ad;
    if (ad == null) {
      debugPrint('InterstitialAdManager: Ad could not be loaded within timeout');
      if (showLoader) AdLoadingOverlay.hide();
      onAdClosed();
      return;
    }

    Timer? fallbackHideTimer;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        fallbackHideTimer?.cancel();
        isFullScreenAdShowing = true;
        if (showLoader) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            AdLoadingOverlay.hide();
          });
        }
        debugPrint('InterstitialAd showed');
      },
      onAdDismissedFullScreenContent: (ad) {
        fallbackHideTimer?.cancel();
        isFullScreenAdShowing = false;
        lastAdDismissedTime = DateTime.now().millisecondsSinceEpoch;
        _ad = null;
        if (showLoader) AdLoadingOverlay.hide();
        ad.dispose();
        loadAd();
        onAdClosed();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        fallbackHideTimer?.cancel();
        isFullScreenAdShowing = false;
        lastAdDismissedTime = DateTime.now().millisecondsSinceEpoch;
        _ad = null;
        if (showLoader) AdLoadingOverlay.hide();
        ad.dispose();
        loadAd();
        onAdClosed();
      },
    );

    _ad = null;
    ad.show();

    if (showLoader) {
      fallbackHideTimer = Timer(const Duration(seconds: 3), () {
        if (!isFullScreenAdShowing) {
          debugPrint('InterstitialAdManager: Fallback timer triggered, hiding loader');
          AdLoadingOverlay.hide();
        }
      });
    }
  }

  Future<void> showOnCardSave({
    required BuildContext context,
    required VoidCallback onComplete,
  }) async {
    await showAd(
      context: context,
      showLoader: true,
      onAdClosed: onComplete,
    );
  }

  Future<void> showAfterSplash({
    required BuildContext context,
    bool showLoader = false,
    required VoidCallback onComplete,
  }) async {
    await showAd(
      context: context,
      showLoader: showLoader,
      loaderDelayMs: 0,
      onAdClosed: onComplete,
    );
  }

  void maybeShow([BuildContext? context]) {
    final ctx = context ?? rootNavigatorKey.currentContext;
    if (ctx != null && ctx.mounted) {
      InterstitialAdCounter.instance.onScreenBack(
        context: ctx,
        onAdClosed: () {},
      );
    }
  }
}
