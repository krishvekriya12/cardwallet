import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/backup/backup_service.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../cards/domain/entities/card_entity.dart';
import '../../../cards/presentation/providers/card_providers.dart';
import 'package:cardwallet/features/transactions/presentation/providers/transaction_providers.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key});

  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  DateTime? _lastBackupTime;
  List<BackupFileInfo> _backups = [];
  bool _loading = false;
  bool _loadingBackups = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loadingBackups = true);
    final time = await BackupService.getLastBackupTime();
    final backups = await BackupService.listBackups();
    if (mounted) {
      setState(() {
        _lastBackupTime = time;
        _backups = backups;
        _loadingBackups = false;
      });
    }
  }

  void _toast(String msg, {bool isError = false}) {
    final c = context.colors;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? c.error : null,
      ),
    );
  }

  Future<String?> _showCreatePasswordDialog() async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final passCtrl = TextEditingController();
        final confirmPassCtrl = TextEditingController();
        String? errorText;
        return StatefulBuilder(
          builder: (context, setStateDialog) {    
            return AlertDialog(
              title: Text(
                l10n.createBackupPass,
                style: TextStyle(
                  color: c.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.backupPassWarning,
                      style: TextStyle(color: c.error, fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: l10n.enterPassLabel,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: confirmPassCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: l10n.confirmPassLabel,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    if (errorText != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        errorText!,
                        style: TextStyle(color: c.error, fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.cancel),
                ),
                TextButton(
                  onPressed: () {
                    final pass = passCtrl.text;
                    final conf = confirmPassCtrl.text;
                    if (pass.isEmpty) {
                      setStateDialog(() {
                        errorText = l10n.passEmptyError;
                      });
                    } else if (pass != conf) {
                      setStateDialog(() {
                        errorText = l10n.passMismatchError;
                      });
                    } else {
                      Navigator.pop(context, pass);
                    }
                  },
                  child: Text(l10n.doneBtn),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<String?> _showRestorePasswordDialog() async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final passCtrl = TextEditingController();
        String? errorText;
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(
                l10n.enterBackupPass,
                style: TextStyle(
                  color: c.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: passCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: l10n.enterPassLabel,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    if (errorText != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        errorText!,
                        style: TextStyle(color: c.error, fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.cancel),
                ),
                TextButton(
                  onPressed: () {
                    final pass = passCtrl.text;
                    if (pass.isEmpty) {
                      setStateDialog(() {
                        errorText = l10n.passEmptyError;
                      });
                    } else {
                      Navigator.pop(context, pass);
                    }
                  },
                  child: Text(l10n.doneBtn),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _exportBackup() async {
    final l10n = AppLocalizations.of(context)!;
    final cardsAsync = ref.read(allCardsProvider);
    List<CardEntity>? cards;
    cardsAsync.when(
      data: (data) => cards = data,
      loading: () => null,
      error: (e, st) => null,
    );
    if (cards == null || cards!.isEmpty) {
      _toast(l10n.noCardsToBackup);
      return;
    }

    final password = await _showCreatePasswordDialog();
    if (password == null || password.isEmpty) return;

    setState(() => _loading = true);
    try {
      final path = await BackupService.exportBackup(cards!, password);
      final _ = path.split('/').last.split('\\').last;
      await _loadData();
      if (mounted) _toast(l10n.backupSuccess);
    } catch (e) {
      if (mounted) _toast(l10n.backupFailed(_localizeError(context, e)), isError: true);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _localizeError(BuildContext context, dynamic error) {
    final l10n = AppLocalizations.of(context)!;
    final msg = error.toString();
    if (msg.contains('Backup file not found')) {
      return l10n.backupFileNotFoundError;
    }
    if (msg.contains('Corrupted or invalid backup file')) {
      return l10n.corruptedBackupError;
    }
    if (msg.contains('Backup file does not contain valid data.')) {
      return l10n.invalidBackupDataError;
    }
    if (msg.contains('Unsupported backup version:')) {
      final match = RegExp(r'version: (\d+)').firstMatch(msg);
      final ver = match != null ? match.group(1) ?? '' : '';
      return l10n.unsupportedBackupVersionError(ver);
    }
    return msg;
  }

  Future<void> _importBackup(BackupFileInfo info) async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          l10n.restoreBackupTitle,
          style: TextStyle(color: c.textPrimary),
        ),
        content: Text(
          l10n.restoreBackupWarning,
          style: TextStyle(color: c.error, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.continueBtn, style: TextStyle(color: c.error)),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    final password = await _showRestorePasswordDialog();
    if (password == null || password.isEmpty) return;

    setState(() => _loading = true);
    try {
      final result = await BackupService.importBackup(info.file.path, password);
      await BackupService.restoreBackup(result);

      ref.invalidate(cardRepositoryProvider);
      ref.invalidate(allCardsProvider);
      ref.invalidate(transactionRepositoryProvider);

      await _loadData();
      if (mounted) _toast(l10n.restoreSuccess);
    } on IncorrectPasswordException {
      if (mounted) _toast(l10n.incorrectPasswordError, isError: true);
    } catch (e) {
      if (mounted) _toast(l10n.restoreFailed(_localizeError(context, e)), isError: true);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _deleteBackup(BackupFileInfo info) async {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          l10n.deleteBackupTitle,
          style: TextStyle(color: c.textPrimary),
        ),
        content: Text(
          l10n.deleteBackupConfirmText(info.displayName),
          style: TextStyle(color: c.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.deleteBtn, style: TextStyle(color: c.error)),
          ),
        ],
      ),
    );
    if (confirm != true) return;
    await info.file.delete();
    await _loadData();
    if (mounted) _toast(l10n.backupDeleted);
  }

  Future<void> _shareBackup(BackupFileInfo info) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      await SharePlus.instance.share(ShareParams(files: [XFile(info.file.path)], text: l10n.backupShareText));
    } catch (e) {
      if (mounted) _toast(l10n.failedShareBackup(e.toString()), isError: true);
    }
  }

  Future<void> _importExternalBackup() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.any,
      );
      if (result == null || result.files.single.path == null) return;
      
      final filePath = result.files.single.path!;
      final fileInfo = BackupFileInfo(
        file: File(filePath),
        name: result.files.single.name,
        modifiedAt: DateTime.now(),
        sizeBytes: result.files.single.size,
      );

      await _importBackup(fileInfo);
    } catch (e) {
      if (mounted) _toast(l10n.failedPickFile(e.toString()), isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.backupRestoreTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: [
              _SectionCard(
                children: [
                  _InfoRow(
                    icon: Icons.cloud_done_outlined,
                    iconColor: context.colors.success,
                    title: l10n.lastBackup,
                    subtitle: _lastBackupTime != null
                        ? DateFormat('dd MMM yyyy, hh:mm a', Localizations.localeOf(context).toString()).format(_lastBackupTime!)
                        : l10n.neverBackedUp,
                  ),
                  Divider(height: 1, color: context.colors.divider, indent: 52),
                  _InfoRow(
                    icon: Icons.info_outline_rounded,
                    title: l10n.backupType,
                    subtitle: l10n.localBackupDesc,
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 350.ms)
                  .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: context.colors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _loading ? null : _exportBackup,
                  icon: _loading
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: ExpressiveLoadingIndicator(
                            color: context.colors.onPrimary,
                            constraints: const BoxConstraints.tightFor(width: 18, height: 18),
                          ),
                        )
                      : const Icon(Icons.cloud_upload_outlined),
                  label: Text(
                    l10n.createBackupBtn,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 350.ms)
                  .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.colors.primary,
                    side: BorderSide(color: context.colors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _loading ? null : _importExternalBackup,
                  icon: const Icon(Icons.file_open_outlined),
                  label: Text(
                    l10n.importExternalBackupBtn,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 130.ms, duration: 350.ms)
                  .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
              const SizedBox(height: 28),
              Text(
                l10n.savedBackupsHeader,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ).animate().fadeIn(delay: 150.ms, duration: 300.ms),
              const SizedBox(height: 12),
              if (_loadingBackups)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ExpressiveLoadingIndicator(
                      color: context.colors.primary,
                      constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                    ),
                  ),
                )
              else if (_backups.isEmpty)
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: context.colors.border),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.folder_open_rounded,
                        size: 40,
                        color: context.colors.textMuted,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        l10n.noBackupsYet,
                        style: TextStyle(
                          color: context.colors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.tapCreateBackupDesc,
                        style: TextStyle(
                          color: context.colors.textMuted,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 350.ms)
              else
                _SectionCard(
                  children: [
                    for (int i = 0; i < _backups.length; i++) ...[
                      if (i > 0)
                        Divider(
                          height: 1,
                          color: context.colors.divider,
                          indent: 16,
                          endIndent: 16,
                        ),
                      _BackupTile(
                        info: _backups[i],
                        onRestore: () => _importBackup(_backups[i]),
                        onShare: () => _shareBackup(_backups[i]),
                        onDelete: () => _deleteBackup(_backups[i]),
                      ).animate().fadeIn(
                            delay: Duration(milliseconds: 200 + i * 60),
                            duration: 300.ms,
                          ),
                    ],
                  ],
                ),
            ],
          ),
          if (_loading)
            ColoredBox(
              color: context.colors.overlay,
              child: Center(
                child: ExpressiveLoadingIndicator(
                  color: context.colors.primary,
                  constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final List<Widget> children;

  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: c.border),
      ),
      child: Column(children: children),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subtitle;

  const _InfoRow({
    required this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: iconColor ?? c.textSecondary, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: c.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackupTile extends StatelessWidget {
  final BackupFileInfo info;
  final VoidCallback onRestore;
  final VoidCallback onShare;
  final VoidCallback onDelete;

  const _BackupTile({
    required this.info,
    required this.onRestore,
    required this.onShare,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: c.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.description_outlined,
              color: c.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  info.sizeLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: c.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRestore,
            icon: Icon(
              Icons.restore_rounded,
              color: c.primary,
              size: 20,
            ),
            tooltip: l10n.restoreTooltip,
          ),
          IconButton(
            onPressed: onShare,
            icon: Icon(
              Icons.share_rounded,
              color: c.primary,
              size: 20,
            ),
            tooltip: l10n.shareTooltip,
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline_rounded,
              color: c.error,
              size: 20,
            ),
            tooltip: l10n.deleteBtn,
          ),
        ],
      ),
    );
  }
}