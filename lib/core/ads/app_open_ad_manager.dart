import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../router/app_router.dart';
import 'ad_ids.dart';
import 'ad_loading_overlay.dart';
import 'app_open_ad_helper.dart';
import 'interstitial_ad_manager.dart';

class AppOpenAdManager with WidgetsBindingObserver {
  AppOpenAdManager._();
  static final AppOpenAdManager instance = AppOpenAdManager._();

  AppOpenAd? _appOpenAd;
  bool _isLoadingAd = false;
  bool _isProcessingAd = false;
  bool _isShowingAd = false;
  bool _wasPaused = false;
  int _loadTime = 0;
  int _lastAdShowTime = 0;
  bool _started = false;

  bool adsDisabled = false;

  static const _maxCacheDurationHours = 4;

  void start() {
    if (_started) return;
    _started = true;
    WidgetsBinding.instance.addObserver(this);
    loadAd();
  }

  void loadAd() {
    if (adsDisabled || _isLoadingAd || isAdAvailable()) return;

    if (!AppOpenAdHelper.shouldShowAd()) {
      debugPrint('AppOpenAdManager: App Open ads disabled via AppOpenAdHelper');
      return;
    }

    _isLoadingAd = true;
    AppOpenAd.load(
      adUnitId: AdIds.appOpen,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          if (adsDisabled) {
            _appOpenAd = null;
            _isLoadingAd = false;
            return;
          }
          _appOpenAd = ad;
          _isLoadingAd = false;
          _loadTime = DateTime.now().millisecondsSinceEpoch;
          debugPrint('App Open ad loaded successfully ✅');
        },
        onAdFailedToLoad: (error) {
          _isLoadingAd = false;
          debugPrint('App Open ad failed to load: ${error.message}');
        },
      ),
    );
  }

  void clearAd() {
    _appOpenAd = null;
    _isLoadingAd = false;
    _isProcessingAd = false;
    _isShowingAd = false;
    _wasPaused = false;
  }

  bool isAdAvailable() {
    return _appOpenAd != null && _wasLoadTimeLessThanNHoursAgo(_maxCacheDurationHours);
  }

  bool _wasLoadTimeLessThanNHoursAgo(int numHours) {
    final dateDifference = DateTime.now().millisecondsSinceEpoch - _loadTime;
    const numMilliSecondsPerHour = 3600000;
    return dateDifference < numMilliSecondsPerHour * numHours;
  }

  Future<void> showAdIfAvailable([BuildContext? context, String? screenName]) async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (!_wasPaused) {
      debugPrint('AppOpenAdManager: App was not paused (not an app resume).');
      return;
    }

    if (currentTime - _lastAdShowTime < 3000) {
      debugPrint('AppOpenAdManager: Ad throttled. Too soon since last app open ad.');
      return;
    }

    if (_isShowingAd || _isProcessingAd || InterstitialAdManager.isFullScreenAdShowing) {
      debugPrint('AppOpenAdManager: App Open ad is already showing/processing or full-screen ad active.');
      return;
    }

    if (!AppOpenAdHelper.shouldShowAd(screenName)) {
      debugPrint('AppOpenAdManager: App Open ad disabled via AppOpenAdHelper.');
      return;
    }

    _wasPaused = false;
    final targetContext = context ?? rootNavigatorKey.currentContext;

    if (targetContext != null && targetContext.mounted) {
      await AdLoadingOverlay.show(
        context: targetContext,
        isWhiteBackground: false,
        message: 'loading ads ...',
      );
    }

    _isProcessingAd = true;

    if (!isAdAvailable()) {
      debugPrint('AppOpenAdManager: Ad not ready, loading now with full screen loader active...');
      loadAd();

      int waitedMs = 0;
      while (!isAdAvailable() && _isLoadingAd && waitedMs < 4000) {
        await Future.delayed(const Duration(milliseconds: 100));
        waitedMs += 100;
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 800));
    }

    if (!isAdAvailable() || InterstitialAdManager.isFullScreenAdShowing) {
      debugPrint('AppOpenAdManager: Ad not available after wait or full screen ad active. Hiding loader.');
      _isProcessingAd = false;
      AdLoadingOverlay.hide();
      return;
    }

    final ad = _appOpenAd;
    if (ad == null) {
      _isProcessingAd = false;
      AdLoadingOverlay.hide();
      return;
    }

    Timer? fallbackHideTimer;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        fallbackHideTimer?.cancel();
        InterstitialAdManager.isFullScreenAdShowing = true;
        _isShowingAd = true;
        _isProcessingAd = false;
        Future.delayed(const Duration(milliseconds: 1000), () {
          AdLoadingOverlay.hide();
        });
        debugPrint('App Open ad showed ✅');
      },
      onAdDismissedFullScreenContent: (ad) {
        fallbackHideTimer?.cancel();
        InterstitialAdManager.isFullScreenAdShowing = false;
        _appOpenAd = null;
        _isShowingAd = false;
        _isProcessingAd = false;
        AdLoadingOverlay.hide();
        debugPrint('App Open ad dismissed');
        loadAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        fallbackHideTimer?.cancel();
        InterstitialAdManager.isFullScreenAdShowing = false;
        _appOpenAd = null;
        _isShowingAd = false;
        _isProcessingAd = false;
        AdLoadingOverlay.hide();
        debugPrint('App Open ad failed to show: ${error.message}');
        loadAd();
      },
    );

    _lastAdShowTime = DateTime.now().millisecondsSinceEpoch;
    _appOpenAd = null;
    ad.show();

    fallbackHideTimer = Timer(const Duration(seconds: 3), () {
      if (!_isShowingAd) {
        debugPrint('AppOpenAdManager: Fallback timer triggered, hiding loader');
        _isProcessingAd = false;
        AdLoadingOverlay.hide();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _wasPaused = true;
      debugPrint('AppOpenAdManager: App paused (backgrounded)');
    } else if (state == AppLifecycleState.resumed) {
      debugPrint('AppOpenAdManager: App resumed, wasPaused: $_wasPaused');
      if (_wasPaused) {
        final context = rootNavigatorKey.currentContext;
        if (context != null && context.mounted) {
          showAdIfAvailable(context);
        }
      }
    }
  }
}
