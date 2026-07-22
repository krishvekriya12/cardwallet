import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_palette.dart';

class BrandGridItem extends StatelessWidget {
  final String asset;
  final String name;
  final VoidCallback onTap;

  const BrandGridItem({
    super.key,
    required this.asset,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = c.isDark;

    final cardBg = isDark ? c.surface : Colors.white;
    final borderColor = isDark
        ? c.border
        : Colors.grey.withValues(alpha: 0.3);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: borderColor,
              width: 1.4,
            ),
            boxShadow: [
              BoxShadow(
                color: c.primary.withValues(alpha: isDark ? 0.03 : 0.015),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              splashColor: c.primary.withValues(alpha: 0.1),
              highlightColor: c.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  'assets/brands/$asset.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 72,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white.withValues(alpha: 0.75) : c.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
