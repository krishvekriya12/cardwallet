import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/ads/native_ad_card_widget.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/surface_card.dart';
import '../../domain/bin_lookup_result.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class BinResultScreen extends StatelessWidget {
  final BinLookupResult result;

  const BinResultScreen({super.key, required this.result});

  String _localizeKey(BuildContext context, String key) {
    final l10n = AppLocalizations.of(context)!;
    switch (key) {
      case 'BIN': return 'BIN';
      case 'Network': return l10n.cardNetwork;
      case 'Type': return l10n.cardType;
      case 'Brand/Category': return l10n.cardBrandCategory;
      case 'Bank': return l10n.cardBank;
      case 'Country': return l10n.cardCountry;
      case 'Country Code': return l10n.cardCountryCode;
      case 'Currency': return l10n.cardCurrency;
      case 'Valid': return l10n.cardValid;
      default: return key;
    }
  }

  String _localizeValue(BuildContext context, String key, String value) {
    final l10n = AppLocalizations.of(context)!;
    if (key == 'Valid') {
      if (value == 'Yes') return l10n.yes;
      if (value == 'No') return l10n.no;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final rows = result.toRows();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.binResultTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: c.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.verified_rounded,
                            color: c.onPrimary, size: 40),
                        const SizedBox(height: 8),
                        Text(
                          result.network,
                          style: TextStyle(
                            color: c.onPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          result.bank,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: c.onPrimary.withValues(alpha: 0.85),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SurfaceCard(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                    child: Column(
                      children: [
                        for (var i = 0; i < rows.length; i++) ...[
                          if (i > 0) const Divider(height: 1),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    _localizeKey(context, rows[i].key),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: c.textSecondary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    _localizeValue(context, rows[i].key, rows[i].value),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: c.textPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.04, end: 0),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: NativeAdCardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
