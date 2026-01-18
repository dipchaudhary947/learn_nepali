class PhraseWord {
  final String nepali;
  final String pronunciation;
  final String meaning;
  final String thaiMeaning;

  PhraseWord({
    required this.nepali,
    required this.pronunciation,
    required this.meaning,
    required this.thaiMeaning,
  });

  factory PhraseWord.fromMap(Map<String, dynamic> map) {
    return PhraseWord(
      nepali: map['nepali'] ?? '',
      pronunciation: map['pronunciation'] ?? '',
      meaning: map['meaning'] ?? '',
      thaiMeaning: map['thaiMeaning'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nepali': nepali,
      'pronunciation': pronunciation,
      'meaning': meaning,
      'thaiMeaning': thaiMeaning,
    };
  }
  String getMeaning(String lang) {
    if (lang == "th") return thaiMeaning;
    return meaning;
  }
}
