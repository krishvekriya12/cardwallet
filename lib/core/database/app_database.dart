// ============================================================
// app_database.dart — Encrypted SQLite Database (AES-256)
// ============================================================
//
// 📚 FLUTTER CONCEPT: Singleton with async initialization
//
// Database ek baar open honi chahiye — baar baar nahi.
// Iske liye Singleton pattern use karte hain.
// But yahan challenge hai: initialization async hai (await chahiye).
//
// Solution:
//   static AppDatabase instance = AppDatabase._(); // Singleton
//   Future<Database> get db async => _db ??= await _init(); // Lazy init
//   '??' = null check operator: agar _db null hai to right side evaluate karo
//   '??=' = agar null hai to assign karo
//
// 📚 FLUTTER CONCEPT: Database Schema Versioning
//
// Schema = tables ki structure (columns, types)
// version: 4 = yeh 4th version ka schema hai
// onUpgrade: jab purana version → naya version ho
//   (users ka app update ho → DB migrate karo)
//
// ============================================================

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

import 'package:cardwallet/core/security/db_passphrase.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
  Database? _db;
  static const _version = 4;
  static const tCards = 'cards';
  static const tTransactions = 'transactions';

  static const cId = 'id';
  static const cHolderName = 'holderName';
  static const cCardNumber = 'cardNumber';
  static const cCardType = 'cardType';
  static const cCardTypeSubtitle = 'cardTypeSubtitle';
  static const cBankName = 'bankName';
  static const cExpiryDate = 'expiryDate';
  static const cNotes = 'notes';
  static const cCardColor = 'cardColor';
  static const cCreatedAt = 'createdAt';
  static const cFrontPhotoPath = 'frontPhotoPath';
  static const cBackPhotoPath = 'backPhotoPath';
  static const cStatementDay = 'statementDay';
  static const cDueDay = 'dueDay';
  static const cReminderEnabled = 'reminderEnabled';
  static const cCustomFields = 'customFields';
  static const cPosition = 'position';

  static const cCardId = 'cardId';
  static const cAmount = 'amount';
  static const cType = 'type';
  static const cMerchant = 'merchant';
  static const cDate = 'date';
  static const cTime = 'time';
  static const cRawSms = 'rawSms';
  static const cCardLastFour = 'cardLastFour';
  static const cAvailableBalance = 'availableBalance';
  static const cFetchedAt = 'fetchedAt';

  Future<Database> get db async {
    _db ??= await _init();
    return _db!;
  }

  Future<Database> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'cardwallet.db');
    final passphrase = await DbPassphrase.get();
    return openDatabase(
      dbPath,
      version: _version,
      password: passphrase,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onOpen: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tCards (
        $cId              INTEGER PRIMARY KEY AUTOINCREMENT,
        $cHolderName      TEXT NOT NULL,
        $cCardNumber      TEXT NOT NULL,
        $cCardType        TEXT NOT NULL,
        $cCardTypeSubtitle TEXT NOT NULL DEFAULT '',
        $cBankName        TEXT NOT NULL,
        $cExpiryDate      TEXT NOT NULL,
        $cNotes           TEXT NOT NULL DEFAULT '',
        $cCardColor       TEXT,
        $cCreatedAt       INTEGER NOT NULL,
        $cFrontPhotoPath  TEXT,
        $cBackPhotoPath   TEXT,
        $cStatementDay    INTEGER,
        $cDueDay          INTEGER,
        $cReminderEnabled INTEGER NOT NULL DEFAULT 0,
        $cCustomFields    TEXT,
        $cPosition        INTEGER NOT NULL DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE $tTransactions (
        $cId              INTEGER PRIMARY KEY AUTOINCREMENT,
        $cCardId          INTEGER NOT NULL,
        $cAmount          REAL NOT NULL,
        $cType            TEXT NOT NULL,
        $cMerchant        TEXT NOT NULL DEFAULT '',
        $cDate            TEXT NOT NULL DEFAULT '',
        $cTime            TEXT NOT NULL DEFAULT '',
        $cRawSms          TEXT NOT NULL DEFAULT '',
        $cCardLastFour    TEXT NOT NULL DEFAULT '',
        $cAvailableBalance TEXT,
        $cFetchedAt       INTEGER NOT NULL,
        FOREIGN KEY ($cCardId) REFERENCES $tCards ($cId) ON DELETE CASCADE
      )
    ''');
    await db.execute(
      'CREATE INDEX idx_tx_card ON $tTransactions ($cCardId)',
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
        'ALTER TABLE $tCards ADD COLUMN $cReminderEnabled INTEGER NOT NULL DEFAULT 0',
      );
    }
    if (oldVersion < 3) {
      await db.execute(
        'ALTER TABLE $tCards ADD COLUMN $cCustomFields TEXT',
      );
    }
    if (oldVersion < 4) {
      await db.execute(
        'ALTER TABLE $tCards ADD COLUMN $cPosition INTEGER NOT NULL DEFAULT 0',
      );
    }
  }

  Future<void> wipeAllData() async {
    final database = await db;
    final batch = database.batch();
    batch.delete(tTransactions);
    batch.delete(tCards);
    await batch.commit(noResult: true);
    await DbPassphrase.reset();
    _db = null;
  }
  Future<void> close() async {
    if (_db != null && _db!.isOpen) {
      await _db!.close();
      _db = null;
    }
  }
}
