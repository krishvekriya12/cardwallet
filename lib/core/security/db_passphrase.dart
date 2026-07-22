// ============================================================
// db_passphrase.dart — AES Encryption Key Manager
// ============================================================
//
// 📚 FLUTTER CONCEPT: flutter_secure_storage
//
// flutter_secure_storage phone ke secure area mein data store karta hai.
// Android: EncryptedSharedPreferences (AES-256 encrypted)
// iOS: Keychain
//
// Regular SharedPreferences: plain text — koi bhi padh sakta hai
// flutter_secure_storage: encrypted — only this app can read
//
// 📚 FLUTTER CONCEPT: Singleton Pattern
//
// Singleton = ek hi instance pure app mein.
// Agar baar baar new DbPassphrase() karein → multiple instances → problems.
// Solution: static instance rakhte hain, factory constructor se wahi dete hain.
//
// ============================================================

import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DbPassphrase {
  DbPassphrase._(); // Private constructor — baahar se new nahi ban sakta

  // Storage key — is naam se save/load hoga
  static const _storageKey = 'cw_db_passphrase_v1';

  // flutter_secure_storage instance
  // 📚 FlutterSecureStorage() = secure storage ka access point
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      // 📚 EncryptedSharedPreferences = Android ka secure storage
      // encryptedSharedPreferences: true → extra layer of encryption
      encryptedSharedPreferences: true,
    ),
  );

  // ─────────────────────────────────────────────────────────
  // get() — Main method
  // ─────────────────────────────────────────────────────────
  //
  // Logic:
  // 1. Pehle check karo — kya passphrase already save hai?
  // 2. Agar hai → wahi return karo (same key har baar)
  // 3. Agar nahi hai → nayi generate karo → save karo → return karo
  //
  static Future<String> get() async {
    // 📚 await = is Future complete hone ka wait karo
    // _storage.read() = storage se value padhlo (async operation)
    final existing = await _storage.read(key: _storageKey);

    if (existing != null && existing.isNotEmpty) {
      return existing; // Already hai → use karo
    }

    // Pehli baar → generate karo
    final passphrase = _generate();

    // Save karo secure storage mein
    await _storage.write(key: _storageKey, value: passphrase);

    return passphrase;
  }

  // ─────────────────────────────────────────────────────────
  // _generate() — Random 32-character key banana
  // ─────────────────────────────────────────────────────────
  //
  // 📚 Random class Dart mein random numbers generate karta hai
  // Random.secure() = cryptographically secure random
  // (Regular Random() predictable ho sakta hai — hacking risk)
  //
  static String _generate() {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*';
    final rng = Random.secure();

    // 📚 List.generate() = N items ki list banao
    // Har item: chars mein se random character
    // .join() = list of chars → single String
    return List.generate(32, (_) => chars[rng.nextInt(chars.length)]).join();
  }

  // ─────────────────────────────────────────────────────────
  // reset() — New key generate karo (wipe all data case)
  // ─────────────────────────────────────────────────────────
  // Warning: Ye karne se DB open nahi hogi — old data permanently lost
  static Future<void> reset() async {
    await _storage.delete(key: _storageKey);
  }
}
