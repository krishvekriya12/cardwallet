import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/bin_lookup_result.dart';

/// Dart port of the Android app's `NeutrinoApiService` BIN-lookup call.
///
/// NOTE: these credentials mirror the demo/test key hardcoded in the
/// original Kotlin app (`RetrofitClient`/`MyPref`). Swap for a real,
/// non-shared key (ideally proxied through a backend) before shipping.
class BinLookupApi {
  BinLookupApi._();

  static const _baseUrl = 'https://neutrinoapi.com/bin-lookup';
  static const _userId = 'harjotsinghgosal';
  static const _apiKey = 'Bu0i863Bp7FWEt9cmSVDq37MG7hpaNHYNhglwUW0IDk28gd9';

  static Future<BinLookupResult> lookup(String bin) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'user-id': _userId,
        'api-key': _apiKey,
        'bin-number': bin,
      },
    );

    final response = await http
        .get(uri)
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('BIN lookup failed (${response.statusCode})');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return BinLookupResult.fromJson(bin, json);
  }
}
