import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ad_ids.dart';
import 'interstitial_ad_manager.dart';

class InterstitialAdCounter {
  InterstitialAdCounter._();
  static final InterstitialAdCounter instance = InterstitialAdCounter._();

  static const String _prefsKey = 'interstitial_back_counter';
  int _backCounter = 0;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    final prefs = await SharedPreferences.getInstance();
    _backCounter = prefs.getInt(_prefsKey) ?? 0;
  }

  Future<void> onScreenBack({
    required BuildContext context,
    required VoidCallback onAdClosed,
  }) async {
    await init();

    if (InterstitialAdManager.instance.adsDisabled) {
      onAdClosed();
      return;
    }

    _backCounter++;
    await _saveCounter();

    final frequency = AdIds.interstitialFrequency;
    if (_backCounter >= frequency) {
      _backCounter = 0;
      await _saveCounter();

      if (!context.mounted) return;
      InterstitialAdManager.instance.showAd(
        context: context,
        showLoader: true,
        onAdClosed: onAdClosed,
      );
    } else {
      onAdClosed();
    }
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, _backCounter);
  }

  Future<void> resetCounter() async {
    _backCounter = 0;
    await _saveCounter();
  }

  int get currentCount => _backCounter;
}
