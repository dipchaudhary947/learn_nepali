import 'phrase_word.dart';

class NepaliCategoryWordViewClassModel {
  final String name;
  final String image;
  final List<PhraseWord> words;

  NepaliCategoryWordViewClassModel({
    required this.name,
    required this.image,
    required this.words,
  });

  factory NepaliCategoryWordViewClassModel.fromMap(Map<String, dynamic> map) {
    return NepaliCategoryWordViewClassModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      words: (map['words'] as List)
          .map((e) => PhraseWord.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'words': words.map((e) => e.toMap()).toList(),
    };
  }
}
