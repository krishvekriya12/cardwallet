import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/security/biometric_auth.dart';
import '../../../../core/security/locale_preference.dart';
import '../../../../core/security/locale_providers.dart';
import '../../../../core/security/lock_preference.dart';
import '../../../../core/security/lock_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/surface_card.dart';
import '../../../../shared/widgets/animated_press_scale.dart';
import '../../../cards/presentation/providers/card_providers.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void _toast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onLockToggled(bool value) async {
    if (value) {
      final l10n = AppLocalizations.of(context)!;
      final canAuth = await BiometricAuth.canAuthenticate();
      if (!canAuth) {
        _toast(l10n.noBiometricsConfigured);
        return;
      }
    }
    await LockPreference.setEnabled(value);
    ref.read(lockEnabledProvider.notifier).setEnabled(value);
  }

  Future<void> _pickLocale() async {
    await context.push('/language');
  }

  Future<void> _clearAllData() async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.clearDataTitle,
          style: TextStyle(color: c.textPrimary),
        ),
        content: Text(
          l10n.clearDataDesc,
          style: TextStyle(color: c.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.clearDataConfirm,
              style: TextStyle(color: c.error),
            ),
          ),
        ],
      ),
    );
    if (confirm != true) return;
    await ref.read(cardActionsProvider).wipeAllData();
    if (!mounted) return;
    _toast(l10n.clearDataToast);
  }

  @override
  Widget build(BuildContext context) {
    final lockEnabled = ref.watch(lockEnabledProvider);
    final activeLocale = ref.watch(localeProvider);
    final localeName = supportedLocales
        .firstWhere((l) => l.code == activeLocale, orElse: () => supportedLocales.first)
        .name;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
       body: SafeArea(
         bottom: false,
         child: ListView(
           padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
           children: [
            Text(
              l10n.settingsTitle,
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),



            SurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _SwitchRow(
                    icon: Icons.lock_outline_rounded,
                    title: l10n.appLock,
                    subtitle: l10n.appLockSubtitle,
                    value: lockEnabled,
                    onChanged: _onLockToggled,
                  ),
                  const _RowDivider(),
                  _NavRow(
                    icon: Icons.language_rounded,
                    title: l10n.language,
                    subtitle: localeName,
                    onTap: _pickLocale,
                  ),
                  const _RowDivider(),
                  _NavRow(
                    icon: Icons.cloud_upload_outlined,
                    title: l10n.backupRestore,
                    subtitle: l10n.backupRestoreSubtitle,
                    onTap: () => context.push('/backup'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _NavRow(
                    icon: Icons.star_outline_rounded,
                    title: l10n.rateUs,
                    onTap: () => _toast(l10n.rateUsThanks),
                  ),
                  const _RowDivider(),
                  _NavRow(
                    icon: Icons.share_outlined,
                    title: l10n.shareApp,
                    onTap: () => _toast(l10n.shareAppSoon),
                  ),
                  const _RowDivider(),
                  _NavRow(
                    icon: Icons.help_outline_rounded,
                    title: l10n.help,
                    onTap: () => _toast(l10n.supportSoon),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SurfaceCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _NavRow(
                    icon: Icons.privacy_tip_outlined,
                    title: l10n.privacyPolicy,
                    onTap: () => _toast(l10n.privacyPolicySoon),
                  ),
                  const _RowDivider(),
                  _NavRow(
                    icon: Icons.description_outlined,
                    title: l10n.termsOfUse,
                    onTap: () => _toast(l10n.termsOfUseSoon),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SurfaceCard(
              borderColor: context.colors.error.withValues(alpha: 0.3),
              child: _NavRow(
                icon: Icons.delete_forever_rounded,
                iconColor: context.colors.error,
                title: l10n.clearAllData,
                titleColor: context.colors.error,
                onTap: _clearAllData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: context.colors.divider,
      indent: 16,
      endIndent: 16,
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchRow({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: c.textSecondary, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: c.textMuted,
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _NavRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final Color? titleColor;
  final String? subtitle;
  final VoidCallback onTap;

  const _NavRow({
    required this.icon,
    this.iconColor,
    required this.title,
    this.titleColor,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AnimatedPressScale(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? c.textSecondary, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: titleColor ?? c.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subtitle!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: c.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: c.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
