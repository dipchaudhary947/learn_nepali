import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/providers/favourites_provider.dart';
import 'package:learn_nepali/providers/nepali_category_provider.dart';
import 'package:learn_nepali/utils/admob/banner_ad_widget.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';

import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    await _tts.setLanguage("ne-NP");
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
  }

  Future<void> _speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final nepaliProvider = context.watch<NepaliCategoryProvider>();
    final selectedCategoryDetails = nepaliProvider.selectedCategory;

    if (selectedCategoryDetails == null) {
      return Scaffold(
        body: Center(
          child: Text(AppLocalizations.of(context)!.noCategorySelected),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategoryDetails.name),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // BODY WITH BANNER AD
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: selectedCategoryDetails.words.length,
              itemBuilder: (context, index) {
                final word = selectedCategoryDetails.words[index];
                final favProvider = context.watch<FavouritesProvider>();
                final isFav = favProvider.isFavourite(word);

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 6,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            word.nepali,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Divider(color: Colors.grey.shade300),
                        const SizedBox(height: 12),

                        Text(
                          '${AppLocalizations.of(context)!.pronunciation} ${word.pronunciation}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${AppLocalizations.of(context)!.meaning} ${word.meaning}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.thaiMeaning} ${word.thaiMeaning}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.mic),
                              color: Colors.green,
                              onPressed: () => _speak(word.nepali),
                            ),
                            IconButton(
                              icon: Icon(
                                isFav ? Icons.star : Icons.star_border,
                              ),
                              color: Colors.green,
                              onPressed: () {
                                final favProvider = context
                                    .read<FavouritesProvider>();
                                final wasFav = favProvider.isFavourite(word);

                                favProvider.toggleFavourite(word);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      wasFav
                                          ? AppLocalizations.of(
                                              context,
                                            )!.removedFromFavorites
                                          : AppLocalizations.of(
                                              context,
                                            )!.addedToFavorites,
                                    ),
                                    backgroundColor: AppColors.primary,
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              color: Colors.green,
                              onPressed: () {
                                final text =
                                    "${word.nepali}\n${word.pronunciation}\n${word.meaning}\n${word.thaiMeaning}";
                                Clipboard.setData(ClipboardData(text: text));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: AppColors.primary,
                                    content: Text("Copied to clipboard"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
                              color: Colors.green,
                              onPressed: () {
                                Share.share(
                                  "🇳🇵 ${word.nepali}\n"
                                  "🔊 ${word.pronunciation}\n"
                                  "🇬🇧 ${word.meaning}\n"
                                  "🇹🇭 ${word.thaiMeaning}",
                                  subject: "Learn Nepali",
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BannerAdWidget(),
          ),
        ],
      ),
    );
  }
}
