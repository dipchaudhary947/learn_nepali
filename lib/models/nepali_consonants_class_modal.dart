class NepaliConsonantsClassModal {
  final String symbol; // The Nepali letter
  final String name;   // Romanized name

  NepaliConsonantsClassModal({required this.symbol, required this.name});

  // Optional: factory constructor to create from a map
  factory NepaliConsonantsClassModal.fromMap(Map<String, dynamic> map) {
    return NepaliConsonantsClassModal(
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
    );
  }

  // Optional: convert to map
  Map<String, String> toMap() {
    return {
      'symbol': symbol,
      'name': name,
    };
  }
}
