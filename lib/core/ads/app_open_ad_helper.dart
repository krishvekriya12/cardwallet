import 'app_open_ad_manager.dart';

class AppOpenAdHelper {
  AppOpenAdHelper._();

  static bool isAdEnabled = false;
  static final Set<String> _disabledScreens = {};

  static void disableAd() {
    isAdEnabled = false;
  }

  static void enableAd() {
    isAdEnabled = true;
    AppOpenAdManager.instance.loadAd();
  }

  static bool shouldShowAd([String? screenName]) {
    if (!isAdEnabled) return false;
    if (screenName != null && _disabledScreens.contains(screenName)) {
      return false;
    }
    return true;
  }

  static void disableAdForScreen(String screenName) {
    _disabledScreens.add(screenName);
  }

  static void enableAdForScreen(String screenName) {
    _disabledScreens.remove(screenName);
  }

  static void clearDisabledScreens() {
    _disabledScreens.clear();
  }
}
