import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../data/emv/emv_card_reader.dart';
import 'add_card_screen.dart';
import '../../../../l10n/genrated/app_localizations.dart';

enum _NfcState { checking, unsupported, ready, scanning, success, failed }

class NfcReaderScreen extends StatefulWidget {
  const NfcReaderScreen({super.key});

  @override
  State<NfcReaderScreen> createState() => _NfcReaderScreenState();
}

class _NfcReaderScreenState extends State<NfcReaderScreen> {
  _NfcState _state = _NfcState.checking;
  EmvCardData? _result;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      final available = await NfcManager.instance.isAvailable();
      if (!mounted) return;
      if (!available) {
        setState(() => _state = _NfcState.unsupported);
        return;
      }
      setState(() => _state = _NfcState.ready);
      _startSession();
    } catch (_) {
      if (!mounted) return;
      setState(() => _state = _NfcState.unsupported);
    }
  }

  Future<void> _startSession() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _state = _NfcState.scanning);
    try {
      await NfcManager.instance.startSession(
        pollingOptions: {NfcPollingOption.iso14443},
        onDiscovered: (tag) async {
          final isoDep = IsoDep.from(tag);
          if (isoDep == null) {
            try {
              await NfcManager.instance.stopSession(
                errorMessage: l10n.unsupportedCardError,
              );
            } catch (_) {}
            if (mounted) {
              setState(() {
                _state = _NfcState.failed;
                _errorMessage = l10n.unsupportedCardError;
              });
            }
            return;
          }

          try {
            final data = await EmvCardReader.read(isoDep);
            try {
              await NfcManager.instance.stopSession();
            } catch (_) {}
            if (!mounted) return;
            if (data == null || !data.hasAnything) {
              setState(() {
                _state = _NfcState.failed;
                _errorMessage = l10n.nfcReadFailedDesc;
              });
            } else {
              setState(() {
                _state = _NfcState.success;
                _result = data;
              });
            }
          } catch (e) {
            try {
              await NfcManager.instance.stopSession(errorMessage: l10n.nfcReadFailedDesc);
            } catch (_) {}
            if (!mounted) return;
            setState(() {
              _state = _NfcState.failed;
              _errorMessage = l10n.nfcReadError(e.toString());
            });
          }
        },
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _state = _NfcState.failed;
        _errorMessage = l10n.nfcStartSessionError(e.toString());
      });
    }
  }

  @override
  void dispose() {
    try {
      NfcManager.instance.stopSession();
    } catch (_) {}
    super.dispose();
  }

  void _useResult() {
    final data = _result;
    if (data == null) return;
    context.pushReplacement(
      '/add-card',
      extra: AddCardArgs(
        prefillNumber: data.pan,
        prefillExpiry: data.expiry,
        prefillHolderName: data.holderName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.nfcReaderTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(child: _buildContent(context)),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    switch (_state) {
      case _NfcState.checking:
        return ExpressiveLoadingIndicator(
          color: c.primary,
          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
        );
      case _NfcState.unsupported:
        return _StatusView(
          icon: Icons.nfc_rounded,
          iconColor: c.error,
          title: l10n.nfcNotAvailable,
          message: l10n.nfcUnsupportedDesc,
        );
      case _NfcState.ready:
        return ExpressiveLoadingIndicator(
          color: c.primary,
          constraints: const BoxConstraints.tightFor(width: 36, height: 36),
        );
      case _NfcState.scanning:
        return _StatusView(
          icon: Icons.nfc_rounded,
          iconColor: c.primary,
          title: l10n.readyToScan,
          message: l10n.holdCardNfcPrompt,
          pulsing: true,
        );
      case _NfcState.failed:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StatusView(
              icon: Icons.error_outline_rounded,
              iconColor: c.error,
              title: l10n.scanFailed,
              message: _errorMessage ?? l10n.somethingWentWrong,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: l10n.tryAgainBtn,
              expand: false,
              onPressed: _startSession,
            ),
          ],
        );
      case _NfcState.success:
        final data = _result!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: c.success,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.cardDetected,
              style: TextStyle(
                color: c.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            if (data.pan != null) _detailRow(l10n.cardNumberLabel, data.pan!),
            if (data.expiry != null) _detailRow(l10n.expiryLabel, data.expiry!),
            if (data.holderName != null) _detailRow(l10n.cardholderLabel, data.holderName!),
            const SizedBox(height: 24),
            PrimaryButton(label: l10n.continueBtn, onPressed: _useResult),
          ],
        );
    }
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              '$label:  ',
              style: TextStyle(color: context.colors.textSecondary),
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: context.colors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusView extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final bool pulsing;

  const _StatusView({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    this.pulsing = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconContainer(c),
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(
            color: c.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: c.textSecondary,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    );

    return content;
  }

  Widget _buildIconContainer(AppPalette c) {
    final iconWidget = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: iconColor.withValues(alpha: 0.25),
          width: 2,
        ),
      ),
      child: Icon(icon, color: iconColor, size: 40),
    );

    if (!pulsing) return iconWidget;

    return _PulsingWidget(child: iconWidget);
  }
}

class _PulsingWidget extends StatefulWidget {
  final Widget child;
  const _PulsingWidget({required this.child});

  @override
  State<_PulsingWidget> createState() => _PulsingWidgetState();
}

class _PulsingWidgetState extends State<_PulsingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1.05).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      ),
      child: widget.child,
    );
  }
}
