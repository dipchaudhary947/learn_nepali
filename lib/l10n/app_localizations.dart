import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_th.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ne'),
    Locale('th')
  ];

  /// Title of the application shown in the app bar
  ///
  /// In en, this message translates to:
  /// **'Namaste🙏 Learn Nepali...!'**
  String get appWelcomeTitle;

  /// Title of the application shown in the app
  ///
  /// In en, this message translates to:
  /// **'Numbers, Vowels, Consonants & Phrases'**
  String get appTitle;

  /// This is a description of Learn Nepali App
  ///
  /// In en, this message translates to:
  /// **'Discover the basics of Nepali with simple lessons on numbers, letters, and phrases. Perfect for beginners who want to start learning quickly!'**
  String get appDescription;

  /// Button text to begin learning Nepali Phrases
  ///
  /// In en, this message translates to:
  /// **'START TO LEARN NEPALI'**
  String get startLearnBtn;

  /// Label for the numbers screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Numbers'**
  String get numbers;

  /// Title for the Nepali Numbers screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Nepali Numbers'**
  String get nepaliNumbers;

  /// Label for the consonants screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Consonants'**
  String get consonants;

  /// Title for the Nepali Consonants screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Nepali Consonants'**
  String get nepaliConsonants;

  /// Label for the vowels screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Vowels'**
  String get vowels;

  /// Title for the Nepali Vowels screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Nepali Vowels'**
  String get nepaliVowels;

  /// Label for the phrases screen where saved words are shown
  ///
  /// In en, this message translates to:
  /// **'Phrases'**
  String get phrases;

  /// Title for the Phrases And Latters screen where saved Categories words are shown with images
  ///
  /// In en, this message translates to:
  /// **'Phrases'**
  String get nepaliPhrases;

  /// Message shown when the user has not selected any category
  ///
  /// In en, this message translates to:
  /// **'No category selected'**
  String get noCategorySelected;

  /// Label shown before the phonetic pronunciation of a Nepali word
  ///
  /// In en, this message translates to:
  /// **'Pronunciation:'**
  String get pronunciation;

  /// Label shown before the meaning or translation of a Nepali word
  ///
  /// In en, this message translates to:
  /// **'Meaning:'**
  String get meaning;

  /// Label shown before the Thai translation of a Nepali word
  ///
  /// In en, this message translates to:
  /// **'Thai Meaning:'**
  String get thaiMeaning;

  /// Message shown when a word or category is removed from the favorites list
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites ❌'**
  String get removedFromFavorites;

  /// Message shown when a word or category is added to the favorites list
  ///
  /// In en, this message translates to:
  /// **'Added to favorites ⭐'**
  String get addedToFavorites;

  /// Label for the search screen where users can find Nepali words
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Hint text shown inside the search input field to prompt users to search Nepali words
  ///
  /// In en, this message translates to:
  /// **'Search Nepali...'**
  String get searchHintText;

  /// Message shown when a user's search returns no results
  ///
  /// In en, this message translates to:
  /// **'No matching results for \'{query}\''**
  String searchNotFound(Object query);

  /// Label for the favorites screen where saved words
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Message shown when the user has not added any words or categories to favorites
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavorites;

  /// Title shown on the language selection screen
  ///
  /// In en, this message translates to:
  /// **'Choose Your Language 🌏'**
  String get chooseLanguage;

  /// language Title showing the list of supported languages in the app
  ///
  /// In en, this message translates to:
  /// **'English • Nepali • Thai'**
  String get languageTitle;

  /// Subtitle shown on the language selection screen explaining what the language choice affects
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language for meanings and translations while learning Nepali.'**
  String get languageSubtitle;

  /// Button text used to open the language selection screen
  ///
  /// In en, this message translates to:
  /// **'SELECT YOUR LANGUAGE'**
  String get selectLanguageButton;

  /// Text shown to prompt the user to choose a language
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectLanguage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ne', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ne': return AppLocalizationsNe();
    case 'th': return AppLocalizationsTh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
