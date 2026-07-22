// ============================================================
// empty_state.dart — "No data" screen widget
// ============================================================
//
// 📚 FLUTTER CONCEPT: Column alignment
//
// Column = widgets vertically arrange karo (top to bottom)
// mainAxisAlignment: MainAxisAlignment.center = vertically center
// crossAxisAlignment: CrossAxisAlignment.center = horizontally center
//
// 📚 FLUTTER CONCEPT: Named parameters with defaults
//
// EmptyState({
//   required String title,       ← zaroor dena
//   String? subtitle,            ← optional
//   VoidCallback? onAction,      ← optional
//   String actionLabel = 'Add',  ← default value hai
// })
//
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_palette.dart';
import 'animated_press_scale.dart';

import '../../l10n/genrated/app_localizations.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onAction;
  final String? actionLabel;

  const EmptyState({
    super.key,
    this.icon = Icons.credit_card_off_rounded,
    required this.title,
    this.subtitle,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDim.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column ko content ke hisaab se shrink karo
          children: [
            // ── Icon Container ───────────────────────────────
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primarySoft,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: AppDim.iconXL, color: AppColors.primary),
            )
                .animate()
                .scale(
                  begin: const Offset(0.8, 0.8),
                  curve: Curves.easeOutBack,
                  duration: 400.ms,
                )
                .fadeIn(duration: 300.ms),

            const SizedBox(height: AppDim.s20),

            // ── Title ─────────────────────────────────────────
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: c.textPrimary,
                letterSpacing: -0.2,
              ),
            )
                .animate(delay: 100.ms)
                .fadeIn()
                .slideY(begin: 0.2, curve: Curves.easeOut),

            if (subtitle != null) ...[
              const SizedBox(height: AppDim.s8),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: c.textSecondary,
                  height: 1.5,
                ),
              ).animate(delay: 150.ms).fadeIn(),
            ],

            if (onAction != null) ...[
              const SizedBox(height: AppDim.s28),
              AnimatedPressScale(
                onTap: onAction,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDim.s24,
                    vertical: AppDim.s14,
                  ),
                  decoration: BoxDecoration(
                    gradient: c.primaryGradient,
                    borderRadius: BorderRadius.circular(AppDim.rFull),
                    boxShadow: c.primaryShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add_rounded,
                          color: AppColors.white, size: AppDim.iconS),
                      const SizedBox(width: AppDim.s6),
                      Text(
                        actionLabel ?? AppLocalizations.of(context)!.addCard,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate(delay: 200.ms).fadeIn().slideY(begin: 0.3),
            ],
          ],
        ),
      ),
    );
  }
}
