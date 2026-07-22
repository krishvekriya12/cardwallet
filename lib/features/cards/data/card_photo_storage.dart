import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Copies picked card photos into the app's private storage and manages their
/// lifecycle. Paths are stored on the card's front/back photo fields.
class CardPhotoStorage {
  CardPhotoStorage._();

  /// Copies [file] into `<appDocs>/card_photos` and returns the absolute path.
  static Future<String> save(XFile file, int cardId, String slot) async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docs.path, 'card_photos'));
    if (!dir.existsSync()) dir.createSync(recursive: true);
    final ext = p.extension(file.path).isNotEmpty ? p.extension(file.path) : '.jpg';
    final dest = p.join(
      dir.path,
      'card_${cardId}_${slot}_${DateTime.now().millisecondsSinceEpoch}$ext',
    );
    await File(file.path).copy(dest);
    return dest;
  }

  static void deleteQuietly(String? path) {
    if (path == null) return;
    try {
      final f = File(path);
      if (f.existsSync()) f.deleteSync();
    } catch (_) {
      // best-effort cleanup
    }
  }
}
