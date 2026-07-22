// ============================================================
// main_scaffold.dart — Shell wrapper with bottom navigation
// ============================================================
//
// 📚 FLUTTER CONCEPT: Scaffold
//
// Scaffold Flutter ka main layout widget hai.
// Isme hum define karte hain:
//   body:           → main content
//   bottomNavigationBar: → neeche navigation
//   appBar:         → upar header
//   floatingActionButton: → floating button
//
// Hum Scaffold ko customize karte hain:
//   - Custom bottom bar (AppBottomBar)
//   - No app bar (screens khud manage karein)
//
// 📚 FLUTTER CONCEPT: StatefulNavigationShell
//
// GoRouter ka StatefulShellRoute ek 'navigationShell' deta hai.
// navigationShell.currentIndex = current active tab
// navigationShell.goBranch(index) = tab switch karo
//
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_bottom_bar.dart';

class MainScaffold extends StatelessWidget {
  /// GoRouter ka shell — current tab index aur goBranch() deta hai
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 📚 extendBody: true = body bottom bar ke neeche bhi jaati hai
      // Isse glassmorphism bottom bar ke through content dikh sakta hai
      extendBody: true,

      // Current tab ka screen dikhao
      // navigationShell khud IndexedStack manage karta hai
      body: navigationShell,

      // Custom premium bottom navigation bar
      bottomNavigationBar: AppBottomBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          // 📚 goBranch() = tab switch karo
          // initialLocation: true → tab ki initial screen pe jaao
          // (agar tab ke andar deep navigate kiya ho toh root pe)
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
