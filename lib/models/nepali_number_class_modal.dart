class NepaliNumberClassModal {
  final String value;
  final String symbol;
  final String name;

  NepaliNumberClassModal({
    required this.value,
    required this.symbol,
    required this.name,
  });

  // Map → Model
  factory NepaliNumberClassModal.fromMap(Map<String, dynamic> map) {
    return NepaliNumberClassModal(
      value: map['value']!,
      symbol: map['symbol']!,
      name: map['name']!,
    );
  }

  // Model → Map
  Map<String, String> toMap() {
    return {
      'value': value,
      'symbol': symbol,
      'name': name,
    };
  }
}
