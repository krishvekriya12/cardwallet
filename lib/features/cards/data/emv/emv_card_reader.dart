import 'dart:typed_data';

import 'package:nfc_manager/platform_tags.dart';

import 'tlv_parser.dart';

class EmvCardData {
  final String? pan;
  final String? expiry; // MM/YY
  final String? holderName;

  const EmvCardData({this.pan, this.expiry, this.holderName});

  bool get hasAnything => pan != null || expiry != null || holderName != null;
}

/// Best-effort EMV contactless read: SELECT PPSE -> SELECT AID ->
/// GET PROCESSING OPTIONS -> READ RECORD, pulling the PAN (tag 5A or the
/// PAN embedded in Track2 Equivalent Data, tag 57), expiry (5F24) and
/// cardholder name (5F20) out of whatever records the card returns.
///
/// EMV kernels vary a lot between card schemes/issuers; this covers the
/// common case (no PDOL data required) and fails gracefully to manual
/// entry otherwise.
class EmvCardReader {
  EmvCardReader._();

  static const _ppseAid = [
    0x32, 0x50, 0x41, 0x59, 0x2E, 0x53, 0x59, 0x53, 0x2E, 0x44, 0x44, 0x46, 0x30, 0x31,
  ];

  static Future<EmvCardData?> read(IsoDep isoDep) async {
    final ppseResp = await _transceive(isoDep, _selectApdu(_ppseAid));
    final ppseEntries = TlvParser.parse(ppseResp);
    final aid = TlvParser.findValue(ppseEntries, '4F');
    if (aid == null) return null;

    final selectAidResp = await _transceive(isoDep, _selectApdu(aid));
    final selectEntries = TlvParser.parse(selectAidResp);

    final gpoResp = await _transceive(
      isoDep,
      Uint8List.fromList([0x80, 0xA8, 0x00, 0x00, 0x02, 0x83, 0x00, 0x00]),
    );
    final gpoEntries = TlvParser.parse(gpoResp);

    final afl = _extractAfl(gpoResp, gpoEntries);

    String? pan;
    String? expiry;
    String? holderName;

    void applyEntries(List<TlvEntry> entries) {
      final panBytes = TlvParser.findValue(entries, '5A');
      if (panBytes != null) pan ??= _digitsFromBcd(panBytes);

      final expBytes = TlvParser.findValue(entries, '5F24');
      if (expBytes != null && expBytes.length >= 2) {
        final yy = expBytes[0].toRadixString(16).padLeft(2, '0');
        final mm = expBytes[1].toRadixString(16).padLeft(2, '0');
        expiry ??= '$mm/$yy';
      }

      final nameBytes = TlvParser.findValue(entries, '5F20');
      if (nameBytes != null) {
        final raw = String.fromCharCodes(nameBytes).trim();
        if (raw.isNotEmpty) holderName ??= raw.replaceAll('/', ' ');
      }

      final track2 = TlvParser.findValue(entries, '57');
      if (track2 != null) {
        final parsed = _parseTrack2(track2);
        if (parsed != null) {
          pan ??= parsed.$1;
          expiry ??= parsed.$2;
        }
      }
    }

    applyEntries(selectEntries);
    applyEntries(gpoEntries);

    for (final record in afl) {
      try {
        final resp = await _transceive(
          isoDep,
          Uint8List.fromList([
            0x00, 0xB2, record.$1, (record.$2 << 3) | 0x04, 0x00,
          ]),
        );
        applyEntries(TlvParser.parse(resp));
      } catch (_) {
        // Some records may not exist on every card; skip failures.
      }
    }

    if (pan == null && expiry == null && holderName == null) return null;
    return EmvCardData(pan: pan, expiry: expiry, holderName: holderName);
  }

  static Uint8List _selectApdu(List<int> aid) {
    return Uint8List.fromList([0x00, 0xA4, 0x04, 0x00, aid.length, ...aid, 0x00]);
  }

  static Future<Uint8List> _transceive(IsoDep isoDep, Uint8List apdu) {
    return isoDep.transceive(data: apdu);
  }

  /// AFL = Application File Locator: list of (SFI, firstRecord, lastRecord,
  /// offlineAuthRecords) 4-byte groups, found either directly in the tag-80
  /// raw response (format 1) or as TLV tag 94 (format 2).
  static List<(int, int)> _extractAfl(Uint8List gpoResp, List<TlvEntry> gpoEntries) {
    Uint8List? aflBytes = TlvParser.findValue(gpoEntries, '94');

    if (aflBytes == null) {
      final tag80 = TlvParser.findValue(TlvParser.parse(gpoResp), '80');
      if (tag80 != null && tag80.length > 2) {
        aflBytes = tag80.sublist(2);
      }
    }
    if (aflBytes == null) return const [];

    final records = <(int, int)>[];
    for (var i = 0; i + 4 <= aflBytes.length; i += 4) {
      final sfi = aflBytes[i] >> 3;
      final first = aflBytes[i + 1];
      final last = aflBytes[i + 2];
      for (var r = first; r <= last; r++) {
        records.add((sfi, r));
      }
    }
    return records;
  }

  static String _digitsFromBcd(Uint8List bytes) {
    final buffer = StringBuffer();
    for (final b in bytes) {
      final hi = (b >> 4) & 0x0F;
      final lo = b & 0x0F;
      if (hi <= 9) buffer.write(hi);
      if (lo <= 9) buffer.write(lo);
    }
    var digits = buffer.toString();
    // PAN is often padded with trailing 'F' nibbles (0xF -> not <=9, so
    // already stopped) — trim any leftover padding just in case.
    digits = digits.replaceAll(RegExp(r'F+$'), '');
    return digits;
  }

  /// Track 2 Equivalent Data: PAN, separator 'D', YYMM expiry, service
  /// code, discretionary data — all BCD-packed.
  static (String, String)? _parseTrack2(Uint8List bytes) {
    final hexStr = TlvParser.hex(bytes);
    final sepIndex = hexStr.indexOf('D');
    if (sepIndex < 1) return null;
    final pan = hexStr.substring(0, sepIndex);
    if (sepIndex + 5 > hexStr.length) return null;
    final yy = hexStr.substring(sepIndex + 1, sepIndex + 3);
    final mm = hexStr.substring(sepIndex + 3, sepIndex + 5);
    return (pan, '$mm/$yy');
  }
}
