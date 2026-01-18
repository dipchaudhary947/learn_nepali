import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'selected_language';

  static const List<Map<String, dynamic>> languages = [
    {
      "name": "English",
      "locale": "en",
    },
    {
      "name": "Nepali",
      "locale": "ne",
    },
    {
      "name": "Thai",
      "locale": "th",
    },
  ];

  Locale _selectedLocale = const Locale('en');
  Locale get selectedLocale => _selectedLocale;

  /// Load saved language on app start
  Future<void> loadLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  final savedLang = prefs.getString(_languageKey);

  if (savedLang != null && savedLang.isNotEmpty) {
    _selectedLocale = Locale(savedLang);
  }
}


  /// Change language and save it
  Future<void> changeLanguage(String languageCode) async {
    _selectedLocale = Locale(languageCode);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);

    notifyListeners();
  }
}
