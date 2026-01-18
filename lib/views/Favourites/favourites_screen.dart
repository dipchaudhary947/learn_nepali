import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/utils/admob/banner_ad_widget.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:learn_nepali/providers/favourites_provider.dart';
import 'package:learn_nepali/widgets/expandable_word_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final FlutterTts tts = FlutterTts();
  final ScrollController _scrollController = ScrollController();

  bool _showBanner = false; // 👈 banner visibility flag

  @override
  void initState() {
    super.initState();
    tts.setLanguage("ne-NP");
    tts.setSpeechRate(0.45);
    tts.setPitch(1.0);

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_showBanner && _scrollController.position.pixels > 50) {
      setState(() {
        _showBanner = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavouritesProvider>();
    final favourites = provider.favourites;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.favorites,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.green),
      ),

      body: Column(
        children: [
          Expanded(
            child: favourites.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.noFavorites,
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: favourites.length,
                    itemBuilder: (context, index) {
                      final word = favourites[index];

                      return ExpandableWordCard(
                        word: word,
                        isFav: true,
                        tts: tts,
                        onFavTap: () {
                          provider.toggleFavourite(word);
                        },
                      );
                    },
                  ),
          ),

          // Banner shows ONLY after scroll
          if (_showBanner) const BannerAdWidget(),
        ],
      ),
    );
  }
}
