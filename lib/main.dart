 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/ads/ad_service.dart';
import 'core/ads/ads_providers.dart';
import 'core/ads/premium_preference.dart';
import 'core/security/locale_preference.dart';
import 'core/security/locale_providers.dart';
import 'core/security/lock_preference.dart';
import 'core/security/lock_providers.dart';
import 'core/theme/theme_preference.dart';
import 'core/theme/theme_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  final results = await Future.wait([
    ThemePreference.getMode(),
    LockPreference.isEnabled(),
    LocalePreference.get(),
    PremiumPreference.get(),
  ]);
  final savedTheme = results[0] as ThemeMode;
  final lockEnabled = results[1] as bool;
  final savedLocale = results[2] as String;
  final isPremium = results[3] as bool;
  await AdService.init(isPremium: isPremium);

  final container = ProviderContainer(
    overrides: [],
  );

  container.read(themeModeProvider.notifier).setMode(savedTheme);
  container.read(lockEnabledProvider.notifier).setEnabled(lockEnabled);
  container.read(localeProvider.notifier).setLocale(savedLocale);
  container.read(isPremiumProvider.notifier).state = isPremium;

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const CardWalletApp(),
    ),
  );
}
