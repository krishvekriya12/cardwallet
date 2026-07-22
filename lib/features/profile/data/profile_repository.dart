import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/profile_info.dart';

/// Optional user profile (display name + photo). Purely local/cosmetic —
/// shown on the Home header when set. The photo is copied into permanent
/// app storage since image_picker's path is a transient cache file.
class ProfileRepository {
  ProfileRepository._();

  static const _nameKey = 'profile_name';
  static const _photoKey = 'profile_photo_path';

  static Future<ProfileInfo> load() async {
    final prefs = await SharedPreferences.getInstance();
    return ProfileInfo(
      name: prefs.getString(_nameKey) ?? '',
      photoPath: prefs.getString(_photoKey),
    );
  }

  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
  }

  static Future<String> savePhoto(String sourcePath) async {
    final dir = await getApplicationDocumentsDirectory();
    final ext = p.extension(sourcePath);
    final dest = p.join(dir.path, 'profile_photo$ext');

    // Remove any previous photo (different extension) before copying.
    await clearPhoto();

    final file = await File(sourcePath).copy(dest);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_photoKey, file.path);
    return file.path;
  }

  static Future<void> clearPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_photoKey);
    if (existing != null) {
      final file = File(existing);
      if (await file.exists()) await file.delete();
    }
    await prefs.remove(_photoKey);
  }
}
