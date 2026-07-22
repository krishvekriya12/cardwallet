import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app_open_ad_manager.dart';
import 'interstitial_ad_counter.dart';
import 'interstitial_ad_manager.dart';

class AdService {
  AdService._();

  static Future<void> init({required bool isPremium}) async {
    InterstitialAdManager.instance.adsDisabled = isPremium;
    AppOpenAdManager.instance.adsDisabled = isPremium;

    if (!isPremium) {
      try {
        await MobileAds.instance.initialize();
        await InterstitialAdCounter.instance.init();
        InterstitialAdManager.instance.loadAd();
        AppOpenAdManager.instance.start();
      } catch (e, stack) {
        debugPrint('AdService.init failed to initialize MobileAds: $e\n$stack');
      }
    }
  }

  static void setPremium(bool isPremium) {
    InterstitialAdManager.instance.adsDisabled = isPremium;
    AppOpenAdManager.instance.adsDisabled = isPremium;

    if (isPremium) {
      InterstitialAdManager.instance.clearAd();
      AppOpenAdManager.instance.clearAd();
    }
  }
}
