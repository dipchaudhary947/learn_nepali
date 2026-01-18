// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appWelcomeTitle => 'नमस्ते 🙏 नेपाली सिक्नुहोस्...!';

  @override
  String get appTitle => 'संख्या, स्वर, व्यञ्जन र वाक्यांश';

  @override
  String get appDescription => 'संख्या, अक्षर र वाक्यांशहरू मार्फत नेपाली भाषाको आधारभूत ज्ञान सिक्नुहोस्। छिटो सिक्न चाहने सुरुवातकर्ताहरूका लागि उपयुक्त!';

  @override
  String get startLearnBtn => 'नेपाली सिक्न सुरु गर्नुहोस्';

  @override
  String get numbers => 'संख्या';

  @override
  String get nepaliNumbers => 'नेपाली संख्या';

  @override
  String get consonants => 'व्यञ्जन';

  @override
  String get nepaliConsonants => 'नेपाली व्यञ्जन';

  @override
  String get vowels => 'स्वर';

  @override
  String get nepaliVowels => 'नेपाली स्वर';

  @override
  String get phrases => 'वाक्यांश';

  @override
  String get nepaliPhrases => 'नेपाली वाक्यांश';

  @override
  String get noCategorySelected => 'कुनै श्रेणी चयन गरिएको छैन';

  @override
  String get pronunciation => 'उच्चारण:';

  @override
  String get meaning => 'अर्थ:';

  @override
  String get thaiMeaning => 'थाई अर्थ:';

  @override
  String get removedFromFavorites => 'मनपर्नेबाट हटाइयो ❌';

  @override
  String get addedToFavorites => 'मनपर्नेमा थपियो ⭐';

  @override
  String get search => 'खोज्नुहोस्';

  @override
  String get searchHintText => 'नेपाली खोज्नुहोस्...';

  @override
  String searchNotFound(Object query) {
    return '\'$query\' का लागि कुनै नतिजा भेटिएन';
  }

  @override
  String get favorites => 'मनपर्ने';

  @override
  String get noFavorites => 'अहिलेसम्म मनपर्ने केही छैन';

  @override
  String get chooseLanguage => 'आफ्नो भाषा छान्नुहोस् 🌏';

  @override
  String get languageTitle => 'अंग्रेजी • नेपाली • थाई';

  @override
  String get languageSubtitle => 'नेपाली सिक्दा अर्थ र अनुवादका लागि आफ्नो मनपर्ने भाषा छान्नुहोस्।';

  @override
  String get selectLanguageButton => 'भाषा चयन गर्नुहोस्';

  @override
  String get selectLanguage => 'भाषा चयन गर्नुहोस्';
}
