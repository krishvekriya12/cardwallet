import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/theme/app_palette.dart';
import '../../data/card_photo_storage.dart';
import '../providers/card_providers.dart';
import '../../../../l10n/genrated/app_localizations.dart';

/// Per-card photo vault: front & back images of the physical card, stored in
/// the app's private storage. Add via camera or gallery, view full-screen,
/// or remove.
class CardPhotosScreen extends ConsumerWidget {
  final int cardId;
  const CardPhotosScreen({super.key, required this.cardId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final cardAsync = ref.watch(cardByIdProvider(cardId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cardPhotosLabel)),
      body: SafeArea(
        child: cardAsync.when(
          loading: () => Center(
            child: ExpressiveLoadingIndicator(
              color: c.primary,
              constraints: const BoxConstraints.tightFor(width: 36, height: 36),
            ),
          ),
          error: (e, _) =>
              Center(child: Text('$e', style: TextStyle(color: c.error))),
          data: (card) {
            if (card == null) {
              return Center(
                child: Text(l10n.cardNotFound,
                    style: TextStyle(color: c.textSecondary)),
              );
            }
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
              children: [
                Text(
                  l10n.cardPhotosDesc,
                  style: TextStyle(color: c.textSecondary, fontSize: 13),
                ),
                const SizedBox(height: 20),
                _PhotoSlot(
                  label: l10n.frontSideLabel,
                  path: card.frontPhotoPath,
                  onPick: (source) => _pick(ref, card.id!, 'front', source,
                      current: card.frontPhotoPath),
                  onRemove: () => _remove(ref, card.id!, 'front',
                      current: card.frontPhotoPath),
                ),
                const SizedBox(height: 18),
                _PhotoSlot(
                  label: l10n.backSideLabel,
                  path: card.backPhotoPath,
                  onPick: (source) => _pick(ref, card.id!, 'back', source,
                      current: card.backPhotoPath),
                  onRemove: () => _remove(ref, card.id!, 'back',
                      current: card.backPhotoPath),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _pick(
    WidgetRef ref,
    int id,
    String slot,
    ImageSource source, {
    String? current,
  }) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source, imageQuality: 85);
    if (file == null) return;
    final path = await CardPhotoStorage.save(file, id, slot);
    final card = await ref.read(cardRepositoryProvider).getCardById(id);
    if (card == null) return;
    final updated = slot == 'front'
        ? card.copyWith(frontPhotoPath: path)
        : card.copyWith(backPhotoPath: path);
    await ref.read(cardActionsProvider).updateCard(updated);
    CardPhotoStorage.deleteQuietly(current);
  }

  Future<void> _remove(
    WidgetRef ref,
    int id,
    String slot, {
    String? current,
  }) async {
    final card = await ref.read(cardRepositoryProvider).getCardById(id);
    if (card == null) return;
    final updated = slot == 'front'
        ? card.copyWith(clearFrontPhotoPath: true)
        : card.copyWith(clearBackPhotoPath: true);
    await ref.read(cardActionsProvider).updateCard(updated);
    CardPhotoStorage.deleteQuietly(current);
  }
}

class _PhotoSlot extends StatelessWidget {
  final String label;
  final String? path;
  final ValueChanged<ImageSource> onPick;
  final VoidCallback onRemove;

  const _PhotoSlot({
    required this.label,
    required this.path,
    required this.onPick,
    required this.onRemove,
  });

  bool get _hasPhoto => path != null && File(path!).existsSync();

  Future<void> _showAddSheet(BuildContext context) async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.photo_camera_rounded, color: c.primary),
              title: Text(l10n.takePhotoLabel),
              onTap: () {
                Navigator.pop(context);
                onPick(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library_rounded, color: c.primary),
              title: Text(l10n.chooseGalleryLabel),
              onTap: () {
                Navigator.pop(context);
                onPick(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _viewFullscreen(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Center(child: InteractiveViewer(child: Image.file(File(path!)))),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: c.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 1.586,
          child: _hasPhoto
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => _viewFullscreen(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.file(File(path!), fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: _CircleButton(
                        icon: Icons.delete_rounded,
                        color: c.error,
                        onTap: onRemove,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: _CircleButton(
                        icon: Icons.edit_rounded,
                        color: c.primary,
                        onTap: () => _showAddSheet(context),
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () => _showAddSheet(context),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: c.surfaceAlt,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: c.primary.withValues(alpha: 0.35),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: c.primarySoft,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add_a_photo_rounded,
                              color: c.primary, size: 24),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.addPhotoPlaceholder(label),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: c.textSecondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
