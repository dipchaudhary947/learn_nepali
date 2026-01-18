import 'package:flutter/material.dart';
import 'package:learn_nepali/models/nepali_category_word_view_class_model.dart';
import 'package:learn_nepali/models/phrase_word.dart';
import 'package:learn_nepali/viewmodels/nepali_category_word_view_modal.dart';

class NepaliCategoryProvider extends ChangeNotifier {
  final _viewModel = NepaliCategoryWordViewModal();

  List<NepaliCategoryWordViewClassModel> _categories = [];
  bool _loading = false;

  NepaliCategoryWordViewClassModel? _selectedCategory;

  // Getters
  List<NepaliCategoryWordViewClassModel> get categories => _categories;
  bool get loading => _loading;
  NepaliCategoryWordViewClassModel? get selectedCategory => _selectedCategory;

  // 🔥 Init Firebase data
  Future<void> init() async {
    _loading = true;
    notifyListeners();

    await _viewModel.uploadOnce();
    _categories = await _viewModel.fetchCategories();

    _loading = false;
    notifyListeners();
  }

  // 📂 Select category
  void selectCategory(NepaliCategoryWordViewClassModel category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // 🌍 SEARCH (simple & fast)
  List<PhraseWord> searchInAllCategories(String query) {
    if (query.isEmpty) return [];

    final lower = query.toLowerCase();
    final List<PhraseWord> results = [];

    for (var category in _categories) {
      for (var word in category.words) {
        if (word.nepali.toLowerCase().contains(lower) ||
            word.meaning.toLowerCase().contains(lower) ||
            word.thaiMeaning.toLowerCase().contains(lower)) {
          results.add(word);
        }
      }
    }

    return results;
  }

  // 📚 ALL WORDS (used when search is empty)
  List<PhraseWord> getAllWords() {
    final List<PhraseWord> all = [];

    for (var category in _categories) {
      all.addAll(category.words);
    }

    return all;
  }
}
