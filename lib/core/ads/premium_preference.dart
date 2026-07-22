import 'package:shared_preferences/shared_preferences.dart';

class PremiumPreference {
  PremiumPreference._();

  static const _key = 'premium_no_ads';

  static Future<bool> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> set(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }
}
