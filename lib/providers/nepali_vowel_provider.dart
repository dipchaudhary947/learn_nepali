import 'package:flutter/material.dart';
import 'package:learn_nepali/models/nepali_vowel_class_modal.dart';
import 'package:learn_nepali/viewmodels/nepali_vowel_view_model.dart';


class NepaliVowelProvider extends ChangeNotifier {
  final _viewModel = NepaliVowelViewModel();

  List<NepaliVowelClassModal> _vowel = [];
  bool _loading = false;

  List<NepaliVowelClassModal> get vowel => _vowel;
  bool get loading => _loading;

  Future<void> init() async {
    print("🚀 NepaliVowelProvider started");

    _loading = true;
    notifyListeners();

    await _viewModel.uploadOnce();
    _vowel = await _viewModel.fetchVowel();

    print("📥 Loaded numbers: ${_vowel.length}");

    _loading = false;
    notifyListeners();
  }
  
}