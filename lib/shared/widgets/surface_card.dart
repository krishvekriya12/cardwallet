import 'package:flutter/material.dart';

import '../../core/theme/app_palette.dart';

/// A clean surface card with a hairline border and soft shadow — the base
/// container for grouped content. Adapts to light/dark via `context.colors`.
class SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 20,
    this.onTap,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final resolvedColor = color ?? (c.isDark ? c.surface : Colors.white);

    Widget currentChild = Padding(
      padding: padding,
      child: child,
    );

    if (onTap != null) {
      currentChild = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: currentChild,
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: c.shadow.withValues(alpha: c.isDark ? 0.12 : 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: resolvedColor,
        type: MaterialType.canvas,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor ?? (c.isDark ? c.border : Colors.grey.withValues(alpha: 0.3)),
          ),
        ),
        child: currentChild,
      ),
    );
  }
}
