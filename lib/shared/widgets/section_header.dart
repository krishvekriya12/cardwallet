// ============================================================
// section_header.dart — Reusable Section Title Row
// ============================================================
//
// 📚 FLUTTER CONCEPT: Row widget
//
// Row = widgets horizontally arrange karo (left to right)
// MainAxisAlignment = horizontal alignment control
//   .spaceBetween = dono ends pe widgets, middle mein space
//   .start = sab left side
//   .center = sab center
// CrossAxisAlignment = vertical alignment control
//   .center = vertically centered
//
// 📚 FLUTTER CONCEPT: Callback functions
//
// VoidCallback = ek function jo kuch return nahi karta
// VoidCallback? = nullable — pass karna optional hai
// Agar null → "See All" button nahi dikhega
//
// ============================================================

import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_palette.dart';
import '../../l10n/genrated/app_localizations.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll; // null hone par button nahi dikhega
  final String? seeAllLabel;
  final Widget? trailing; // Custom trailing widget (optional)

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
    this.seeAllLabel,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;

    return Row(
      // 📚 MainAxisAlignment.spaceBetween
      // Title left, button right — space fills in between
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ── Left accent bar ─────────────────────────────────
        // 📚 Container with specific width/height = rectangle widget
        Container(
          width: AppDim.sectionBarWidth,  // 4dp wide bar
          height: AppDim.sectionBarHeight, // 18dp tall
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppDim.rFull),
          ),
        ),

        const SizedBox(width: AppDim.s8),

        // ── Title ────────────────────────────────────────────
        // 📚 Expanded = baki sara space lo (pushes trailing to right)
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 17,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
              color: c.textPrimary,
            ),
          ),
        ),

        // ── Trailing / See All ────────────────────────────────
        if (trailing != null)
          trailing!
        else if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDim.s8,
                vertical: AppDim.s4,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  seeAllLabel ?? AppLocalizations.of(context)!.seeAll,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: AppDim.s2),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
