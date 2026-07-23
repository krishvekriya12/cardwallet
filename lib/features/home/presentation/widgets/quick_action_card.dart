import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/animated_press_scale.dart';

class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String tag;
  final VoidCallback onTap;
  final Color accentColor;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tag,
    required this.onTap,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;
    final accent = accentColor;
    final cardBg = isDark ? c.surface : Colors.white;

    return AnimatedPressScale(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.06),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: c.shadow.withValues(alpha: isDark ? 0.08 : 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Icon Container & Corner Micro Tag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: isDark ? 0.18 : 0.10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 19, color: accent),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: isDark ? 0.14 : 0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag.toUpperCase(),
                    style: TextStyle(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w800,
                      color: accent,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Title & Description
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
                color: c.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
                color: c.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
