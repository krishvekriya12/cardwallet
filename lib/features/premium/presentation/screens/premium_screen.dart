import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ads/ad_service.dart';
import '../../../../core/ads/ads_providers.dart';
import '../../../../core/ads/premium_preference.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class PremiumScreen extends ConsumerWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final isPremium = ref.watch(isPremiumProvider);

    final benefits = [
      (Icons.block_rounded, l10n.benefitRemoveAdsTitle, l10n.benefitRemoveAdsDesc),
      (Icons.bolt_rounded, l10n.benefitFasterTitle, l10n.benefitFasterDesc),
      (Icons.favorite_rounded, l10n.benefitSupportTitle, l10n.benefitSupportDesc),
      (Icons.workspace_premium_rounded, l10n.benefitBadgeTitle, l10n.benefitBadgeDesc),
    ];

    Future<void> setPremium(bool value) async {
      ref.read(isPremiumProvider.notifier).state = value;
      await PremiumPreference.set(value);
      AdService.setPremium(value);
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.premiumTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            // Hero
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
              decoration: BoxDecoration(
                color: c.primary,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: c.primary.withValues(alpha: c.isDark ? 0.15 : 0.35),
                    blurRadius: 28,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: c.onPrimary.withValues(alpha: 0.16),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.workspace_premium_rounded,
                        color: c.onPrimary, size: 38),
                  )
                      .animate(onPlay: (ctrl) => ctrl.repeat(reverse: true))
                      .scale(
                        begin: const Offset(1, 1),
                        end: const Offset(1.08, 1.08),
                        duration: 1200.ms,
                        curve: Curves.easeInOut,
                      ),
                  const SizedBox(height: 18),
                  Text(
                    isPremium ? l10n.premiumHeroActive : l10n.premiumHeroInactive,
                    style: TextStyle(
                      color: c.onPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isPremium
                        ? l10n.premiumHeroDescActive
                        : l10n.premiumHeroDescInactive,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: c.onPrimary.withValues(alpha: 0.85),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 28),
            for (var i = 0; i < benefits.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _BenefitRow(
                  icon: benefits[i].$1,
                  title: benefits[i].$2,
                  subtitle: benefits[i].$3,
                ).animate(delay: (120 + i * 70).ms).fadeIn(duration: 300.ms).slideX(
                      begin: 0.1,
                      end: 0,
                    ),
              ),
            const SizedBox(height: 12),
            if (isPremium)
              OutlinedButton(
                onPressed: () => setPremium(false),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  side: BorderSide(color: c.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  l10n.disablePremiumBtn,
                  style: TextStyle(
                    color: c.textSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            else
              PrimaryButton(
                label: l10n.removeAdsBtn,
                icon: Icons.lock_open_rounded,
                onPressed: () => setPremium(true),
              ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                l10n.premiumOneTimeNotice,
                style: TextStyle(color: c.textMuted, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _BenefitRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: c.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: c.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: c.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: c.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(color: c.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
