import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:cryptography/cryptography.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/cards/data/models/card_model.dart';
import '../../features/cards/domain/entities/card_entity.dart';
import '../../features/transactions/domain/transaction_entity.dart';
import '../database/app_database.dart';

class BackupService {
  BackupService._();

  static const _lastBackupKey = 'last_backup_timestamp';
  static const int _iterations = 10000;
  static const int _keyLengthBits = 256;

  static Future<DateTime?> getLastBackupTime() async {
    final prefs = await SharedPreferences.getInstance();
    final ms = prefs.getInt(_lastBackupKey);
    return ms != null ? DateTime.fromMillisecondsSinceEpoch(ms) : null;
  }

  static Future<void> _saveBackupTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastBackupKey, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<List<TransactionEntity>> _getAllTransactions() async {
    final db = await AppDatabase.instance.db;
    final maps = await db.query('transactions');
    return maps.map(TransactionEntity.fromMap).toList();
  }



  static Future<Uint8List> _encrypt(Uint8List clearText, String password) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: _iterations,
      bits: _keyLengthBits,
    );

    final secureRandom = Random.secure();
    final salt = Uint8List.fromList(List.generate(16, (_) => secureRandom.nextInt(256)));
    final iv = Uint8List.fromList(List.generate(12, (_) => secureRandom.nextInt(256)));

    final secretKey = await pbkdf2.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: salt,
    );

    final algorithm = AesGcm.with256bits();
    final secretBox = await algorithm.encrypt(
      clearText,
      secretKey: secretKey,
      nonce: iv,
    );

    final builder = BytesBuilder();
    builder.add(salt);
    builder.add(iv);
    builder.add(secretBox.cipherText);
    builder.add(secretBox.mac.bytes);

    return builder.takeBytes();
  }

  static Future<Uint8List> _decrypt(Uint8List encrypted, String password) async {
    if (encrypted.length < 44) {
      throw const FormatException('Corrupted or invalid backup file');
    }

    final salt = encrypted.sublist(0, 16);
    final iv = encrypted.sublist(16, 28);
    final tag = encrypted.sublist(encrypted.length - 16);
    final cipherText = encrypted.sublist(28, encrypted.length - 16);

    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: _iterations,
      bits: _keyLengthBits,
    );

    final secretKey = await pbkdf2.deriveKey(
      secretKey: SecretKey(utf8.encode(password)),
      nonce: salt,
    );

    final algorithm = AesGcm.with256bits();
    final secretBox = SecretBox(
      cipherText,
      nonce: iv,
      mac: Mac(tag),
    );

    try {
      final decrypted = await algorithm.decrypt(
        secretBox,
        secretKey: secretKey,
      );
      return Uint8List.fromList(decrypted);
    } catch (_) {
      throw IncorrectPasswordException();
    }
  }

  static Future<String> exportBackup(List<CardEntity> cards, String password, {List<TransactionEntity>? transactions}) async {
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now()
        .toIso8601String()
        .replaceAll(':', '-')
        .replaceAll('.', '-')
        .split('T')
        .first;
    final file = File('${dir.path}/cardwallet_backup_$timestamp.cwbackup');

    final cardMaps = cards.map((c) {
      final model = CardModel.fromEntity(c);
      return model.toMap();
    }).toList();

    final txList = transactions ?? await _getAllTransactions();
    final txMaps = txList.map((tx) => tx.toMap()).toList();

    final jsonContent = jsonEncode({
      'version': 1,
      'cards': cardMaps,
      'subscriptions': [],
      'transactions': txMaps,
    });

    final archive = Archive();
    final jsonBytes = utf8.encode(jsonContent);
    archive.addFile(ArchiveFile('backup_data.json', jsonBytes.length, jsonBytes));

    for (final card in cards) {
      if (card.frontPhotoPath != null) {
        final f = File(card.frontPhotoPath!);
        if (f.existsSync()) {
          final bytes = f.readAsBytesSync();
          archive.addFile(ArchiveFile('photos/${f.uri.pathSegments.last}', bytes.length, bytes));
        }
      }
      if (card.backPhotoPath != null) {
        final f = File(card.backPhotoPath!);
        if (f.existsSync()) {
          final bytes = f.readAsBytesSync();
          archive.addFile(ArchiveFile('photos/${f.uri.pathSegments.last}', bytes.length, bytes));
        }
      }
    }

    final zipBytes = ZipEncoder().encode(archive);
    final encryptedBytes = await _encrypt(Uint8List.fromList(zipBytes), password);
    await file.writeAsBytes(encryptedBytes);

    await _saveBackupTime();
    return file.path;
  }

  static Future<BackupImportResult> importBackup(String filePath, String password) async {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception('Backup file not found');
    }

    final encryptedBytes = await file.readAsBytes();
    final decryptedBytes = await _decrypt(encryptedBytes, password);

    final archive = ZipDecoder().decodeBytes(decryptedBytes);

    Map<String, dynamic>? backupPayload;
    final Map<String, List<int>> photoEntries = {};

    for (final zipFile in archive) {
      if (zipFile.name == 'backup_data.json') {
        final jsonContent = utf8.decode(zipFile.content as List<int>);
        backupPayload = jsonDecode(jsonContent) as Map<String, dynamic>;
      } else if (zipFile.name.startsWith('photos/')) {
        final fileName = zipFile.name.substring(7); // Remove "photos/"
        if (fileName.isNotEmpty) {
          photoEntries[fileName] = zipFile.content as List<int>;
        }
      }
    }

    if (backupPayload == null) {
      throw const FormatException('Backup file does not contain valid data.');
    }

    final version = backupPayload['version'] as int? ?? 1;
    if (version > 1) {
      throw Exception('Unsupported backup version: $version');
    }

    final cardsJson = backupPayload['cards'] as List<dynamic>? ?? [];
    final transactionsJson = backupPayload['transactions'] as List<dynamic>? ?? [];

    final rawCards = cardsJson.map((m) {
      final map = m as Map<String, dynamic>;
      final dynamic rem = map['reminderEnabled'];
      final int reminderInt = (rem == true || rem == 1) ? 1 : 0;
      
      final Map<String, dynamic> updatedMap = Map.from(map);
      updatedMap['reminderEnabled'] = reminderInt;

      String? cardColor = map['cardColor'] as String?;
      if (cardColor == null) {
        final customFieldsRaw = map['customFields'] as String?;
        if (customFieldsRaw != null && customFieldsRaw.isNotEmpty) {
          try {
            final decoded = jsonDecode(customFieldsRaw) as Map<String, dynamic>;
            final customGrad = decoded['customGradient'] as String?;
            if (customGrad != null && customGrad.isNotEmpty) {
              cardColor = customGrad;
            }
          } catch (_) {}
        }
        final cardSkinId = map['cardSkinId'] as int?;
        if (cardColor == null && cardSkinId != null && cardSkinId != 0) {
          cardColor = '#${(0xFFFFFF & cardSkinId).toRadixString(16).padLeft(6, '0').toUpperCase()}';
        }
      }
      updatedMap['cardColor'] = cardColor;
      
      return CardModel.fromMap(updatedMap);
    }).toList();

    final rawTransactions = transactionsJson
        .map((m) => TransactionEntity.fromMap(m as Map<String, dynamic>))
        .toList();

    return BackupImportResult(
      cards: rawCards,
      transactions: rawTransactions,
      photoEntries: photoEntries,
    );
  }

  static Future<void> restoreBackup(BackupImportResult result) async {
    final docs = await getApplicationDocumentsDirectory();
    final photoDir = Directory(p.join(docs.path, 'card_photos'));
    if (!photoDir.existsSync()) {
      photoDir.createSync(recursive: true);
    }

    final db = await AppDatabase.instance.db;
    await db.transaction((txn) async {
      await txn.delete('transactions');
      await txn.delete('cards');

      for (final card in result.cards) {
        String? newFrontPath;
        if (card.frontPhotoPath != null) {
          final fileName = p.basename(card.frontPhotoPath!);
          if (result.photoEntries.containsKey(fileName)) {
            final destFile = File(p.join(photoDir.path, fileName));
            destFile.writeAsBytesSync(result.photoEntries[fileName]!);
            newFrontPath = destFile.path;
          }
        }

        String? newBackPath;
        if (card.backPhotoPath != null) {
          final fileName = p.basename(card.backPhotoPath!);
          if (result.photoEntries.containsKey(fileName)) {
            final destFile = File(p.join(photoDir.path, fileName));
            destFile.writeAsBytesSync(result.photoEntries[fileName]!);
            newBackPath = destFile.path;
          }
        }

        final updatedCard = CardModel(
          id: card.id,
          holderName: card.holderName,
          cardNumber: card.cardNumber,
          cardType: card.cardType,
          cardTypeSubtitle: card.cardTypeSubtitle,
          bankName: card.bankName,
          expiryDate: card.expiryDate,
          notes: card.notes,
          cardColor: card.cardColor,
          createdAt: card.createdAt,
          frontPhotoPath: newFrontPath,
          backPhotoPath: newBackPath,
          statementDay: card.statementDay,
          dueDay: card.dueDay,
          reminderEnabled: card.reminderEnabled,
          customFields: card.customFields,
          position: card.position,
        );

        await txn.insert('cards', updatedCard.toMap());
      }

      for (final tx in result.transactions) {
        await txn.insert('transactions', tx.toMap());
      }
    });
  }

  static Future<List<BackupFileInfo>> listBackups() async {
    final dir = await getApplicationDocumentsDirectory();
    final entities = dir.listSync();
    final files = entities
        .whereType<File>()
        .where(
          (f) =>
              f.path.contains('cardwallet_backup_') &&
              f.path.endsWith('.cwbackup'),
        )
        .toList()
      ..sort((a, b) => b.path.compareTo(a.path));

    return Future.wait(
      files.map((f) async {
        final stat = await f.stat();
        return BackupFileInfo(
          file: f,
          name: f.uri.pathSegments.last,
          modifiedAt: stat.modified,
          sizeBytes: stat.size,
        );
      }),
    );
  }
}

class BackupImportResult {
  final List<CardModel> cards;
  final List<TransactionEntity> transactions;
  final Map<String, List<int>> photoEntries;

  const BackupImportResult({
    required this.cards,
    required this.transactions,
    required this.photoEntries,
  });
}

class BackupFileInfo {
  final File file;
  final String name;
  final DateTime modifiedAt;
  final int sizeBytes;

  const BackupFileInfo({
    required this.file,
    required this.name,
    required this.modifiedAt,
    required this.sizeBytes,
  });

  String get displayName {
    return name.replaceFirst('cardwallet_backup_', '').replaceAll('.cwbackup', '');
  }

  String get sizeLabel {
    if (sizeBytes < 1024) return '${sizeBytes}B';
    return '${(sizeBytes / 1024).toStringAsFixed(1)}KB';
  }
}

class IncorrectPasswordException implements Exception {
  @override
  String toString() => 'Incorrect password or corrupted backup file.';
}
