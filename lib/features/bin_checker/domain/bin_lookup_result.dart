class BinLookupResult {
  final String bin;
  final String network;
  final String type;
  final String brand;
  final String country;
  final String countryCode;
  final String bank;
  final String currency;
  final bool valid;

  const BinLookupResult({
    required this.bin,
    required this.network,
    required this.type,
    required this.brand,
    required this.country,
    required this.countryCode,
    required this.bank,
    required this.currency,
    required this.valid,
  });

  factory BinLookupResult.fromJson(String bin, Map<String, dynamic> json) {
    return BinLookupResult(
      bin: (json['bin-number'] ?? bin).toString(),
      network: (json['card-brand'] ?? '—').toString(),
      type: (json['card-type'] ?? '—').toString(),
      brand: (json['card-category'] ?? '—').toString(),
      country: (json['country'] ?? '—').toString(),
      countryCode: (json['country-code'] ?? '—').toString(),
      bank: (json['issuer'] ?? '—').toString(),
      currency: (json['currency-code'] ?? '—').toString(),
      valid: json['valid'] == true,
    );
  }

  List<MapEntry<String, String>> toRows() => [
    MapEntry('BIN', bin),
    MapEntry('Network', network),
    MapEntry('Type', type),
    MapEntry('Brand/Category', brand),
    MapEntry('Bank', bank),
    MapEntry('Country', country),
    MapEntry('Country Code', countryCode),
    MapEntry('Currency', currency),
    MapEntry('Valid', valid ? 'Yes' : 'No'),
  ];
}
