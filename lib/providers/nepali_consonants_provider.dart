import 'package:flutter/material.dart';
import 'package:learn_nepali/models/nepali_consonants_class_modal.dart';
import 'package:learn_nepali/viewmodels/nepali_consonants_view_model.dart';

class NepaliConsonantsProvider extends ChangeNotifier {
  final _viewModel = NepaliConsonantsViewModel();

  List<NepaliConsonantsClassModal> _consonants = [];
  bool _loading = false;

  List<NepaliConsonantsClassModal> get consonants => _consonants;
  bool get loading => _loading;

  Future<void> init() async {
    print("🚀 NepaliConsonantsProvider started");

    _loading = true;
    notifyListeners();

    await _viewModel.uploadOnce();
    _consonants = await _viewModel.fetchConsonants();

    print("📥 Loaded numbers: ${_consonants.length}");

    _loading = false;
    notifyListeners();
  }
  
}