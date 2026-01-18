import 'package:flutter/material.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/providers/nepali_category_provider.dart';
import 'package:learn_nepali/utils/admob/banner_ad_widget.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';
import 'package:learn_nepali/views/CategoryDetail/category_detail_screen.dart';
import 'package:learn_nepali/views/Changelanguage/change_language_screen.dart';
import 'package:learn_nepali/views/Favourites/favourites_screen.dart';
import 'package:learn_nepali/views/Search/search_screen.dart';
import 'package:provider/provider.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nepaliCategoriesListProvider =
        context.watch<NepaliCategoryProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.nepaliPhrases,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        actionsIconTheme: const IconThemeData(color: Colors.green),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavouritesScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ChangeLanguageScreen()),
              );
            },
          ),
        ],
      ),

      // 👇 BODY WITH BANNER INSIDE
      body: Column(
        children: [
          // Main grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount:
                  nepaliCategoriesListProvider.categories.length,
              itemBuilder: (context, index) {
                final category =
                    nepaliCategoriesListProvider.categories[index];

                return GestureDetector(
                  onTap: () {
                    nepaliCategoriesListProvider
                        .selectCategory(category);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const CategoryDetailScreen(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(8.0),
                            child: Image.asset(
                              category.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4),
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // BANNER AD
          const BannerAdWidget(),
        ],
      ),
    );
  }
}
