import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/ads/interstitial_ad_manager.dart';
import '../../../../core/security/biometric_auth.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/card_utils.dart';
import '../../../../shared/widgets/surface_card.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/entities/card_type.dart';
import '../providers/card_providers.dart';
import '../widgets/card_color.dart';
import '../widgets/card_preview.dart';
import 'add_card_screen.dart';
import '../../../../l10n/genrated/app_localizations.dart';

String _getCustomFieldLabel(BuildContext context, String key) {
  final l10n = AppLocalizations.of(context)!;
  switch (key) {
    case 'pnrNumber': return l10n.pnrNumberLabel;
    case 'eventVenue': return l10n.venueLabel;
    case 'eventDate': return l10n.eventDateLabel;
    case 'eventSeat': return l10n.seatLabel;
    case 'eventClass': return l10n.classLabel;
    case 'discountDetails': return l10n.discountDetailsLabel;
    case 'memberId': return l10n.memberIdLabel;
    case 'tierStatus': return l10n.tierStatusLabel;
    case 'pointsBalance': return l10n.pointsBalanceLabel;
    case 'secondaryPin': return l10n.secondaryPinLabel;
    case 'issueDate': return l10n.issueDateLabel;
    case 'documentTitle': return l10n.documentTitleLabel;
    default: return key;
  }
}

class CardDetailsScreen extends ConsumerStatefulWidget {
  final int cardId;

  const CardDetailsScreen({super.key, required this.cardId});

  @override
  ConsumerState<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends ConsumerState<CardDetailsScreen> {
  bool _numberVisible = false;
  bool _cvvVisible = false;

  Future<void> _toggleCvv() async {
    final l10n = AppLocalizations.of(context)!;
    if (_cvvVisible) {
      setState(() => _cvvVisible = false);
      return;
    }
    final ok = await BiometricAuth.authenticate(l10n.revealCvv);
    if (ok) setState(() => _cvvVisible = true);
  }

  Future<void> _delete(CardEntity card) async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteCardPrompt),
        content: Text(l10n.deleteCardWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.deleteBtn,
              style: TextStyle(color: c.error),
            ),
          ),
        ],
      ),
    );
    if (confirm != true) return;
    await ref.read(cardActionsProvider).deleteCard(card.id!);
    if (!mounted) return;
    context.pop();
  }

  void _shareCard(BuildContext context, CardEntity card) {
    final l10n = AppLocalizations.of(context)!;
    final type = CardType.fromValue(card.cardType);
    final buffer = StringBuffer();
    buffer.writeln(l10n.cardDetailsHeader);
    buffer.writeln('${l10n.typePrefix}${type.getLocalizedLabel(context)}');
    if (card.bankName.isNotEmpty) {
      buffer.writeln('${l10n.bankPrefix}${card.bankName}');
    }
    buffer.writeln('${l10n.cardNumberPrefix}${card.cardNumber}');
    buffer.writeln('${l10n.cardholderPrefix}${card.holderName}');
    if (type.isPayment && card.expiryDate.isNotEmpty) {
      buffer.writeln('${l10n.expiryPrefix}${card.expiryDate}');
    }

    // Custom fields excluding CVV
    card.customFields.forEach((key, value) {
      if (key != 'cvvNumber' && value.isNotEmpty) {
        final label = _getCustomFieldLabel(context, key);
        buffer.writeln('$label: $value');
      }
    });

    if (card.notes.isNotEmpty) {
      buffer.writeln('${l10n.notesPrefix}${card.notes}');
    }

    SharePlus.instance.share(
      ShareParams(
        text: buffer.toString(),
        subject: '${card.bankName} ${type.getLocalizedLabel(context)}${l10n.detailsSuffix}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final asyncCard = ref.watch(cardByIdProvider(widget.cardId));

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          InterstitialAdManager.instance.maybeShow(context);
        }
      },
      child: Scaffold(
        backgroundColor: c.page,
        appBar: AppBar(
          title: Text(l10n.cardDetailsTitle),
          actions: const [], // Delete icon removed from top
        ),
        body: asyncCard.when(
          data: (card) {
            if (card == null) {
              return Center(
                child: Text(
                  l10n.cardNotFound,
                  style: TextStyle(color: c.textSecondary),
                ),
              );
            }
            return _buildBody(context, card);
          },
          loading: () => Center(
            child: ExpressiveLoadingIndicator(
              color: c.primary,
              constraints: const BoxConstraints.tightFor(width: 36, height: 36),
            ),
          ),
          error: (e, st) => Center(
            child: Text('$e', style: TextStyle(color: c.error)),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CardEntity card) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final type = CardType.fromValue(card.cardType);
    final color = resolveCardColor(card);
    final gradient = resolveCardGradient(card);
    
    // Check custom fields against localization keys
    final extraFields = card.customFields.entries
        .where((e) =>
            e.key != 'cvvNumber' && e.value.isNotEmpty)
        .toList();

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
        children: [
          CardPreview(
            type: type,
            color: color,
            gradient: gradient,
            holderName: card.holderName,
            number: card.cardNumber,
            expiry: card.expiryDate,
            bankName: card.bankName,
            masked: !_numberVisible,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _ActionCircle(
                icon: _numberVisible
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                label: _numberVisible ? l10n.hideBtn : l10n.revealBtn,
                onTap: () => setState(() => _numberVisible = !_numberVisible),
              ),
              _ActionCircle(
                icon: Icons.share_rounded, // Copy removed, Share added
                label: l10n.shareTooltip,
                onTap: () => _shareCard(context, card),
              ),
              _ActionCircle(
                icon: Icons.edit_rounded,
                label: l10n.editBtn,
                onTap: () => context.push(
                  '/add-card',
                  extra: AddCardArgs(cardId: card.id),
                ),
              ),
              _ActionCircle(
                icon: Icons.delete_outline_rounded, // Delete added
                label: l10n.deleteBtn,
                iconColor: c.error,
                onTap: () => _delete(card),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            l10n.cardInformationHeader,
            style: TextStyle(
              color: c.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          SurfaceCard(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            child: Column(
              children: [
                _InfoRow(
                  label: l10n.cardNumberLabel,
                  value: _numberVisible
                      ? (type.isPayment
                          ? CardUtils.formatCardNumber(card.cardNumber)
                          : card.cardNumber)
                      : (type.isPayment
                          ? CardUtils.maskNumber(card.cardNumber)
                          : card.cardNumber),
                ),
                if (card.bankName.isNotEmpty)
                  _InfoRow(label: l10n.bankLabel, value: card.bankName),
                _InfoRow(
                  label: type.isPayment ? l10n.cardholderLabel : l10n.nameLabel,
                  value: card.holderName,
                ),
                if (type.isPayment && card.expiryDate.isNotEmpty)
                  _InfoRow(label: l10n.expiryLabel, value: card.expiryDate),
                if (type.isPayment && card.customFields['cvvNumber'] != null)
                  _InfoRow(
                    label: l10n.cvvLabel,
                    value: _cvvVisible
                        ? card.customFields['cvvNumber']!
                        : '•••',
                    trailing: IconButton(
                      onPressed: _toggleCvv,
                      icon: Icon(
                        _cvvVisible
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: c.textSecondary,
                        size: 18,
                      ),
                    ),
                  ),
                for (final field in extraFields)
                  _InfoRow(
                    label: _getCustomFieldLabel(context, field.key),
                    value: field.value,
                  ),
              ],
            ),
          ),
          if (card.notes.isNotEmpty) ...[
            const SizedBox(height: 16),
            SurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.notesLabel,
                    style: TextStyle(
                      color: c.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    card.notes,
                    style: TextStyle(color: c.textPrimary),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ActionCircle extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  const _ActionCircle({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: c.primarySoft,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor ?? c.primary,
                size: 22,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: c.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const _InfoRow({required this.label, required this.value, this.trailing});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                color: c.textSecondary,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: c.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
