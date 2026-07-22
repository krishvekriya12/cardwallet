import 'dart:io';

class AdIds {
  AdIds._();
  static const bool useTestIds = true;

  static const _testInterstitialAndroid = 'ca-app-pub-3940256099942544/1033173712';
  static const _testInterstitialIos = 'ca-app-pub-3940256099942544/4411468910';
  static const _testAppOpenAndroid = 'ca-app-pub-3940256099942544/9257395921';
  static const _testAppOpenIos = 'ca-app-pub-3940256099942544/5575463023';
  static const _testNativeAndroid = 'ca-app-pub-3940256099942544/2247696110';
  static const _testNativeIos = 'ca-app-pub-3940256099942544/3986624511';

  static const _prodInterstitialAndroid = 'REPLACE_WITH_ANDROID_INTERSTITIAL_ID';
  static const _prodInterstitialIos = 'REPLACE_WITH_IOS_INTERSTITIAL_ID';
  static const _prodAppOpenAndroid = 'REPLACE_WITH_ANDROID_APP_OPEN_ID';
  static const _prodAppOpenIos = 'REPLACE_WITH_IOS_APP_OPEN_ID';
  static const _prodNativeAndroid = 'REPLACE_WITH_ANDROID_NATIVE_ID';
  static const _prodNativeIos = 'REPLACE_WITH_IOS_NATIVE_ID';

  static bool get _android => Platform.isAndroid;

  static String get interstitial {
    if (useTestIds) {
      return _android ? _testInterstitialAndroid : _testInterstitialIos;
    }
    final prodId = _android ? _prodInterstitialAndroid : _prodInterstitialIos;
    if (prodId.startsWith('REPLACE_WITH')) {
      return _android ? _testInterstitialAndroid : _testInterstitialIos;
    }
    return prodId;
  }

  static String get appOpen {
    if (useTestIds) {
      return _android ? _testAppOpenAndroid : _testAppOpenIos;
    }
    final prodId = _android ? _prodAppOpenAndroid : _prodAppOpenIos;
    if (prodId.startsWith('REPLACE_WITH')) {
      return _android ? _testAppOpenAndroid : _testAppOpenIos;
    }
    return prodId;
  }

  static String get native {
    if (useTestIds) {
      return _android ? _testNativeAndroid : _testNativeIos;
    }
    final prodId = _android ? _prodNativeAndroid : _prodNativeIos;
    if (prodId.startsWith('REPLACE_WITH')) {
      return _android ? _testNativeAndroid : _testNativeIos;
    }
    return prodId;
  }

  static const int interstitialFrequency = 3;
}
