import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/security/locale_preference.dart';
import '../../../../core/security/locale_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/surface_card.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});

  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final activeLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.language,
          style: TextStyle(color: c.textPrimary, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: c.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SurfaceCard(
              padding: EdgeInsets.zero,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: supportedLocales.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: c.border.withValues(alpha: 0.5),
                ),
                itemBuilder: (context, index) {
                  final locale = supportedLocales[index];
                  final isSelected = locale.code == activeLocale;
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    leading: Text(
                      locale.flag,
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(
                      locale.name,
                      style: TextStyle(
                        color: c.textPrimary,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check_circle_rounded, color: c.primary)
                        : null,
                    onTap: () async {
                      await LocalePreference.set(locale.code);
                      ref.read(localeProvider.notifier).setLocale(locale.code);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
