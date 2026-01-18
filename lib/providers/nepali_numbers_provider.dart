import 'package:flutter/material.dart';
import 'package:learn_nepali/models/nepali_number_class_modal.dart';
import 'package:learn_nepali/viewmodels/nepali_numbers_view_model.dart';

class NepaliNumbersProvider extends ChangeNotifier {
  final _viewModel = NepaliNumbersViewModel();

  List<NepaliNumberClassModal> _numbers = [];
  bool _loading = false;

  List<NepaliNumberClassModal> get numbers => _numbers;
  bool get loading => _loading;

  Future<void> init() async {
    print("🚀 NepaliNumbersProvider started");

    _loading = true;
    notifyListeners();

    await _viewModel.uploadOnce();
    _numbers = await _viewModel.fetchNumbers();

    print("📥 Loaded numbers: ${_numbers.length}");

    _loading = false;
    notifyListeners();
  }
}
