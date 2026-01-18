import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn_nepali/providers/favourites_provider.dart';
import 'package:learn_nepali/providers/language_provider.dart';
import 'package:learn_nepali/providers/nepali_category_provider.dart';
import 'package:learn_nepali/providers/nepali_consonants_provider.dart';
import 'package:learn_nepali/providers/nepali_numbers_provider.dart';
import 'package:learn_nepali/providers/nepali_vowel_provider.dart';
import 'package:learn_nepali/utils/constants/app_theme.dart';
import 'package:learn_nepali/views/Home/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final languageProvider = LanguageProvider();
  await languageProvider.loadLanguage(); // LOAD SAVED LANGUAGE

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NepaliNumbersProvider()..init()),
        ChangeNotifierProvider(
          create: (_) => NepaliConsonantsProvider()..init(),
        ),
        ChangeNotifierProvider(create: (_) => NepaliVowelProvider()..init()),
        ChangeNotifierProvider(create: (_) => NepaliCategoryProvider()..init()),
        ChangeNotifierProvider(create: (_) => FavouritesProvider()..init()),
        ChangeNotifierProvider.value(value: languageProvider),
      ],
      child: const MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('en'), Locale('th'), Locale('ne')],
      locale: context.watch<LanguageProvider>().selectedLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Nepali Learn',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
