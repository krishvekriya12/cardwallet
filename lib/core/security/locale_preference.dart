import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleOption {
  final String code;
  final String flag;
  final String name;

  const LocaleOption(this.code, this.flag, this.name);
}

const List<LocaleOption> supportedLocales = [
  LocaleOption('ar', '🇸🇦', 'العربية'),
  LocaleOption('zh', '🇨🇳', '中文'),
  LocaleOption('nl', '🇳🇱', 'Nederlands'),
  LocaleOption('en', '🇬🇧', 'English'),
  LocaleOption('fil', '🇵🇭', 'Filipino'),
  LocaleOption('fr', '🇫🇷', 'Français'),
  LocaleOption('de', '🇩🇪', 'Deutsch'),
  LocaleOption('he', '🇮🇱', 'עברית'),
  LocaleOption('hi', '🇮🇳', 'हिन्दी'),
  LocaleOption('id', '🇮🇩', 'Bahasa Indonesia'),
  LocaleOption('it', '🇮🇹', 'Italiano'),
  LocaleOption('ja', '🇯🇵', '日本語'),
  LocaleOption('ko', '🇰🇷', '한국어'),
  LocaleOption('ms', '🇲🇾', 'Bahasa Melayu'),
  LocaleOption('pl', '🇵🇱', 'Polski'),
  LocaleOption('pt', '🇵🇹', 'Português'),
  LocaleOption('ru', '🇷🇺', 'Русский'),
  LocaleOption('es', '🇪🇸', 'Español'),
  LocaleOption('th', '🇹🇭', 'ไทย'),
  LocaleOption('tr', '🇹🇷', 'Türkçe'),
  LocaleOption('vi', '🇻🇳', 'Tiếng Việt'),
];

class LocalePreference {
  LocalePreference._();

  static const _key = 'locale_code';

  static Future<String> get() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    if (saved != null) return saved;

    // Detect platform/system locale on first launch
    final systemLocale = PlatformDispatcher.instance.locale.languageCode;
    // 'fil' is sometimes returned as 'tl' on older OS versions
    final targetCode = systemLocale == 'tl' ? 'fil' : systemLocale;

    final isSupported = supportedLocales.any((l) => l.code == targetCode);
    return isSupported ? targetCode : 'en';
  }

  static Future<void> set(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, code);
  }
}

