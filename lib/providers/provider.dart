// import 'package:flutter/material.dart';
// import 'package:learn_nepali/models/nepali_category_word_view_class_model.dart';
// import 'package:learn_nepali/models/nepali_consonants_class_modal.dart';
// import 'package:learn_nepali/models/nepali_number_class_modal.dart';
// import 'package:learn_nepali/models/nepali_vowel_class_modal.dart';
// import 'package:learn_nepali/utils/data/nepali_consonants.dart';
// import 'package:learn_nepali/utils/data/nepali_numbers_data.dart';
// import 'package:learn_nepali/utils/data/nepali_vowels_data.dart';
// import 'package:learn_nepali/utils/data/phrases_categories_data.dart';

// class NepaliProvider extends ChangeNotifier {
//   // ===================== Numbers =====================
//   final List<NepaliNumberClassModal> _numbers = nepaliNumbersData
//       .map((e) => NepaliNumberClassModal.fromMap(e))
//       .toList();
//   List<NepaliNumberClassModal> get numbers => _numbers;

//   // ===================== Vowels =====================
//   final List<NepaliVowelClassModal> _vowels =
//       nepaliVowelsData.map((e) => NepaliVowelClassModal.fromMap(e)).toList();
//   List<NepaliVowelClassModal> get vowels => _vowels;

//   // ===================== Consonants =====================
//   final List<NepaliConsonantsClassModal> _consonants =
//       nepaliConsonantsData.map((e) => NepaliConsonantsClassModal.fromMap(e)).toList();
//   List<NepaliConsonantsClassModal> get consonants => _consonants;

//   // ===================== Categories & Phrases =====================
//   final List<Category> _categoryList = categoriesData; 
//   List<Category> get categories => _categoryList;

//   // ===================== Selected Category =====================
//   Category? _selectedCategory;
//   Category? get selectedCategory => _selectedCategory;

//   /// Sets the currently selected category and notifies listeners
//   void selectCategory(Category category) {
//     _selectedCategory = category;
//     notifyListeners();
//   }

//   // ===================== Search Functions =====================

//   /// Search words inside the selected category
//   List<Word> searchWordsInSelectedCategory(String query) {
//     if (_selectedCategory == null || query.isEmpty) return [];
//     return _selectedCategory!.words.where((word) {
//       return word.nepali.contains(query) ||
//           word.meaning.toLowerCase().contains(query.toLowerCase());
//     }).toList();
//   }

//   /// Search words across all categories
//   List<Word> searchWordsAcrossAllCategories(String query) {
//     if (query.isEmpty) return [];
//     List<Word> results = [];
//     for (var category in _categoryList) {
//       results.addAll(category.words.where((word) {
//         return word.nepali.contains(query) ||
//             word.meaning.toLowerCase().contains(query.toLowerCase());
//       }));
//     }
//     return results;
//   }

//   // ===================== Favourites =====================
// final List<Word> _favouriteWords = [];
// List<Word> get favouriteWords => _favouriteWords;

// }