import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ads/interstitial_ad_manager.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../cards/domain/entities/card_type.dart';
import '../../../cards/presentation/widgets/card_preview.dart';
import '../../data/bin_lookup_api.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class BinCheckerScreen extends StatefulWidget {
  const BinCheckerScreen({super.key});

  @override
  State<BinCheckerScreen> createState() => _BinCheckerScreenState();
}

class _BinCheckerScreenState extends State<BinCheckerScreen> {
  final _controller = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _check() async {
    final l10n = AppLocalizations.of(context)!;
    final bin = _controller.text.replaceAll(RegExp(r'\D'), '');
    if (bin.length < 6) {
      setState(() => _error = l10n.enterMin6Digits);
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final result = await BinLookupApi.lookup(bin);
      if (!mounted) return;
      setState(() => _loading = false);
      if (result.valid) {
        InterstitialAdManager.instance.maybeShow(context);
        context.push('/bin-checker/result', extra: result);
      } else {
        setState(() => _error = l10n.binNotVerified);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = l10n.lookupFailed;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.binCheckerTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardPreview(
                      type: CardType.credit,
                      color: context.colors.primary,
                      holderName: l10n.binLookupPlaceholder,
                      number: _controller.text,
                      expiry: '',
                      bankName: '',
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      style: TextStyle(color: context.colors.textPrimary),
                      decoration: InputDecoration(
                        labelText: l10n.enterDigitsLabel,
                        counterText: '',
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    if (_error != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _error!,
                        style: TextStyle(color: context.colors.error, fontSize: 13),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: PrimaryButton(
                label: l10n.checkButton,
                icon: Icons.search_rounded,
                loading: _loading,
                onPressed: _loading ? null : _check,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
