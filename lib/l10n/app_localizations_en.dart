// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appWelcomeTitle => 'Namaste🙏 Learn Nepali...!';

  @override
  String get appTitle => 'Numbers, Vowels, Consonants & Phrases';

  @override
  String get appDescription => 'Discover the basics of Nepali with simple lessons on numbers, letters, and phrases. Perfect for beginners who want to start learning quickly!';

  @override
  String get startLearnBtn => 'START TO LEARN NEPALI';

  @override
  String get numbers => 'Numbers';

  @override
  String get nepaliNumbers => 'Nepali Numbers';

  @override
  String get consonants => 'Consonants';

  @override
  String get nepaliConsonants => 'Nepali Consonants';

  @override
  String get vowels => 'Vowels';

  @override
  String get nepaliVowels => 'Nepali Vowels';

  @override
  String get phrases => 'Phrases';

  @override
  String get nepaliPhrases => 'Phrases';

  @override
  String get noCategorySelected => 'No category selected';

  @override
  String get pronunciation => 'Pronunciation:';

  @override
  String get meaning => 'Meaning:';

  @override
  String get thaiMeaning => 'Thai Meaning:';

  @override
  String get removedFromFavorites => 'Removed from favorites ❌';

  @override
  String get addedToFavorites => 'Added to favorites ⭐';

  @override
  String get search => 'Search';

  @override
  String get searchHintText => 'Search Nepali...';

  @override
  String searchNotFound(Object query) {
    return 'No matching results for \'$query\'';
  }

  @override
  String get favorites => 'Favorites';

  @override
  String get noFavorites => 'No favorites yet';

  @override
  String get chooseLanguage => 'Choose Your Language 🌏';

  @override
  String get languageTitle => 'English • Nepali • Thai';

  @override
  String get languageSubtitle => 'Select your preferred language for meanings and translations while learning Nepali.';

  @override
  String get selectLanguageButton => 'SELECT YOUR LANGUAGE';

  @override
  String get selectLanguage => 'Select Your Language';
}
