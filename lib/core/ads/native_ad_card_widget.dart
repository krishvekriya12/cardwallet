import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../theme/app_palette.dart';

import 'ad_ids.dart';
import 'ads_providers.dart';

class NativeAdCardWidget extends ConsumerStatefulWidget {
  final String factoryId;

  const NativeAdCardWidget({
    super.key,
    this.factoryId = 'binCheckerNativeAd',
  });

  @override
  ConsumerState<NativeAdCardWidget> createState() => _NativeAdCardWidgetState();
}

class _NativeAdCardWidgetState extends ConsumerState<NativeAdCardWidget> {
  NativeAd? _nativeAd;
  bool _isLoaded = false;
  bool _failedToLoad = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    final isPremium = ref.read(isPremiumProvider);
    if (isPremium) return;

    _nativeAd = NativeAd(
      adUnitId: AdIds.native,
      factoryId: widget.factoryId,
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('NativeAd failed to load: ${error.message}');
          ad.dispose();
          if (!mounted) return;
          setState(() {
            _failedToLoad = true;
          });
        },
      ),
    );

    _nativeAd?.load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPremium = ref.watch(isPremiumProvider);
    if (isPremium || _failedToLoad) {
      return const SizedBox.shrink();
    }

    final c = context.colors;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!_isLoaded || _nativeAd == null) {
      return _buildComponentShimmer(context);
    }

    return Container(
      width: double.infinity,
      height: 154,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AdWidget(ad: _nativeAd!),
      ),
    );
  }

  Widget _buildComponentShimmer(BuildContext context) {
    final c = context.colors;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final shimmerBase = isDark ? const Color(0xFF2A2A38) : const Color(0xFFE2E8F0);
    final shimmerHighlight = isDark ? const Color(0xFF3F3F54) : const Color(0xFFF8FAFC);

    Widget shimmerBox({
      required double width,
      required double height,
      double radius = 6.0,
    }) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: shimmerBase,
          borderRadius: BorderRadius.circular(radius),
        ),
      )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .shimmer(
            duration: 1200.ms,
            color: shimmerHighlight,
          );
    }

    return Container(
      width: double.infinity,
      height: 154,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          shimmerBox(width: 120, height: 120, radius: 12),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    shimmerBox(width: 40, height: 40, radius: 8),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          shimmerBox(width: double.infinity, height: 15, radius: 4),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              shimmerBox(width: 24, height: 14, radius: 4),
                              const SizedBox(width: 8),
                              shimmerBox(width: 55, height: 14, radius: 4),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                shimmerBox(width: double.infinity, height: 11, radius: 4),
                const SizedBox(height: 4),
                shimmerBox(width: 110, height: 11, radius: 4),

                const SizedBox(height: 8),

                shimmerBox(width: double.infinity, height: 34, radius: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
