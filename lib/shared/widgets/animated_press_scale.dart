// ============================================================
// animated_press_scale.dart — Tap pe Scale Down animation
// ============================================================
//
// 📚 FLUTTER CONCEPT: GestureDetector
//
// GestureDetector user ke gestures detect karta hai:
//   onTap          → simple tap
//   onTapDown      → jab finger screen pe aaye
//   onTapUp        → jab finger screen se uthe
//   onTapCancel    → tap cancel ho (scroll ho gaya)
//   onLongPress    → press hold karo
//   onPanUpdate    → drag karo
//
// Hamara button:
//   onTapDown → scale 0.94 (press down feel)
//   onTapUp   → scale 1.0 (spring back)
//   onTap     → actual action
//
// 📚 FLUTTER CONCEPT: AnimatedScale
//
// AnimatedScale = scale change ko smoothly animate karta hai
// scale: 0.94 se 1.0 → spring-back feel
// Binaa is widget ke: button tap pe suddenly shrink hota
// Iske saath: smooth elastic animation milti hai
//
// ============================================================

import 'package:flutter/material.dart';
import '../../core/theme/app_dimensions.dart';

/// Reusable "press and scale" wrapper — premium button feel.
///
/// Wrap any widget with this to get elastic press animation.
///
/// ```dart
/// AnimatedPressScale(
///   onTap: () => doSomething(),
///   child: MyButton(),
/// )
/// ```
class AnimatedPressScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale; // How much to shrink (0.94 = 6% shrink)

  const AnimatedPressScale({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 0.94,
  });

  @override
  State<AnimatedPressScale> createState() => _AnimatedPressScaleState();
}

class _AnimatedPressScaleState extends State<AnimatedPressScale> {
  // Track kar: user pressing hai ya nahi
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 📚 behavior: HitTestBehavior.opaque
      // Transparent area bhi tappable hogi
      // Default mein transparent area tap miss ho jaata hai
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        // 📚 Ternary operator: condition ? trueValue : falseValue
        // _isPressed true hai → widget.scale (0.94)
        // _isPressed false hai → 1.0 (normal size)
        scale: _isPressed ? widget.scale : 1.0,
        duration: AppDim.micro, // 150ms — quick response
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
