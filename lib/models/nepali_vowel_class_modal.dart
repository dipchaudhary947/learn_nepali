class NepaliVowelClassModal {
  final String symbol;
  final String name;

  NepaliVowelClassModal({required this.symbol, required this.name});

  // Create from Map
  factory NepaliVowelClassModal.fromMap(Map<String, dynamic> map) {
    return NepaliVowelClassModal(
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
    );
  }

  // Convert to Map (optional)
  Map<String, String> toMap() {
    return {
      'symbol': symbol,
      'name': name,
    };
  }
}
