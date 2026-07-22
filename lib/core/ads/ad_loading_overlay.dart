import 'package:flutter/material.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';
import '../router/app_router.dart';
import '../theme/app_colors.dart';

class AdLoadingOverlay {
  AdLoadingOverlay._();
  static OverlayEntry? _overlayEntry;

  static bool get isShowing => _overlayEntry != null;

  static Future<void> show({
    BuildContext? context,
    bool isWhiteBackground = false,
    String message = 'loading ads ...',
  }) async {
    hide();

    OverlayState? overlayState;
    if (context != null && context.mounted) {
      overlayState = Overlay.maybeOf(context, rootOverlay: true);
    }
    overlayState ??= rootNavigatorKey.currentState?.overlay;

    if (overlayState == null) {
      debugPrint('AdLoadingOverlay: Could not find OverlayState!');
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (ctx) {
        return Material(
          color: Colors.transparent,
          child: Container(
            color: isWhiteBackground
                ? Colors.white
                : Colors.black.withValues(alpha: 0.5),
            child: Center(
              child: Container(
                width: 200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 36,
                      height: 36,
                      child: ExpressiveLoadingIndicator(
                        color: AppColors.primary,
                        constraints: BoxConstraints.tightFor(width: 36, height: 36),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        decoration: TextDecoration.none,
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(_overlayEntry!);

    try {
      await WidgetsBinding.instance.endOfFrame;
    } catch (_) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  static void hide() {
    try {
      if (_overlayEntry != null && _overlayEntry!.mounted) {
        _overlayEntry!.remove();
      }
    } catch (e) {
      debugPrint('AdLoadingOverlay: Exception during hide overlay: $e');
    } finally {
      _overlayEntry = null;
    }
  }
}
