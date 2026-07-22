import 'dart:typed_data';

/// A single BER-TLV entry: tag (as a hex string, e.g. "5A" or "5F24") and
/// its raw value bytes.
class TlvEntry {
  final String tag;
  final Uint8List value;

  const TlvEntry(this.tag, this.value);
}

/// Minimal BER-TLV decoder covering the subset EMV contactless responses
/// use: single-byte tags, two-byte tags starting with 0x5F/0x9F/0xBF/0x9C,
/// and short/one-extra-byte length encoding. Good enough to pull PAN
/// (5A), expiry (5F24), cardholder name (5F20) and AFL (94) out of
/// SELECT/GPO/READ RECORD responses.
class TlvParser {
  TlvParser._();

  static List<TlvEntry> parse(Uint8List data) {
    final entries = <TlvEntry>[];
    var i = 0;
    while (i < data.length) {
      if (data[i] == 0x00 || data[i] == 0xFF) {
        i++;
        continue;
      }

      final tagStart = i;
      var tagLen = 1;
      // Multi-byte tag: low 5 bits of first byte all set.
      if ((data[i] & 0x1F) == 0x1F) {
        tagLen = 2;
        while (i + tagLen < data.length && (data[i + tagLen] & 0x80) == 0x80) {
          tagLen++;
        }
        tagLen++; // include the terminating byte
      }
      if (tagStart + tagLen > data.length) break;
      final tagBytes = data.sublist(tagStart, tagStart + tagLen);
      final tag = tagBytes
          .map((b) => b.toRadixString(16).padLeft(2, '0'))
          .join()
          .toUpperCase();
      i = tagStart + tagLen;

      if (i >= data.length) break;
      int length;
      if ((data[i] & 0x80) == 0) {
        length = data[i];
        i += 1;
      } else {
        final numBytes = data[i] & 0x7F;
        i += 1;
        if (i + numBytes > data.length) break;
        length = 0;
        for (var k = 0; k < numBytes; k++) {
          length = (length << 8) | data[i + k];
        }
        i += numBytes;
      }

      if (i + length > data.length) break;
      final value = data.sublist(i, i + length);
      entries.add(TlvEntry(tag, value));
      i += length;

      // Recurse into known constructed templates. Tag 80 (GPO response
      // format 1) is deliberately excluded — it's raw AIP+AFL bytes, not
      // nested TLV.
      const constructedTags = {'6F', '77', 'A5', '70', '61'};
      if (constructedTags.contains(tag)) {
        entries.addAll(parse(value));
      }
    }
    return entries;
  }

  static Uint8List? findValue(List<TlvEntry> entries, String tag) {
    for (final e in entries) {
      if (e.tag == tag) return e.value;
    }
    return null;
  }

  static String hex(Uint8List bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join().toUpperCase();
}
