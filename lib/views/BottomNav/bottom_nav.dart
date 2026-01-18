import 'package:flutter/material.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';
import 'package:learn_nepali/views/BottomNav/navScreens/Numbers/numbers_screen.dart';
import 'package:learn_nepali/views/BottomNav/navScreens/Phrases/phrases_screens.dart';
import 'package:learn_nepali/views/BottomNav/navScreens/consonants/consonants_screens.dart';
import 'package:learn_nepali/views/BottomNav/navScreens/vowels/vowels_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> navPages = const [
    NumbersScreen(),
    ConsonantsScreens(),
    VowelsScreen(),
    PhrasesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    
    // Get localized strings
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: navPages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primary,
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.textPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.format_list_numbered, size: 30),
            label: l10n.numbers,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book, size: 30),
            label: l10n.consonants,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book, size: 30),
            label: l10n.vowels,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_books, size: 30),
            label: l10n.phrases,
          ),
        ],
      ),
    );
  }
}
