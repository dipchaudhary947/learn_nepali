import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/providers/favourites_provider.dart';
import 'package:learn_nepali/providers/nepali_category_provider.dart';
import 'package:learn_nepali/utils/admob/banner_ad_widget.dart';
import 'package:learn_nepali/widgets/expandable_word_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";
  final FlutterTts _tts = FlutterTts();

  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;

  static const int _pageSize = 30;
  int _loadedCount = _pageSize;

  bool _showBanner = false; // banner visibility flag

  @override
  void initState() {
    super.initState();
    _tts.setLanguage("ne-NP");
    _tts.setSpeechRate(0.45);

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _tts.stop();
    super.dispose();
  }

  // Scroll listener
  void _onScroll() {
    // Show banner after user scrolls
    if (!_showBanner && _scrollController.position.pixels > 50) {
      setState(() {
        _showBanner = true;
      });
    }

    // Lazy loading
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (mounted) {
        setState(() {
          _loadedCount += _pageSize;
        });
      }
    }
  }

  // Debounced search
  void _onSearchChanged(String value) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;

      setState(() {
        query = value;
        _loadedCount = _pageSize;
      });

      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NepaliCategoryProvider>();
    final favProvider = context.watch<FavouritesProvider>();

    final allWords = query.isEmpty
        ? provider.getAllWords()
        : provider.searchInAllCategories(query);

    final visibleWords = allWords.take(_loadedCount).toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        title: SizedBox(
          height: 42,
          child: TextField(
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchHintText,
              prefixIcon: const Icon(Icons.search, color: Colors.green),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Colors.green, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              suffixIcon: query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.green),
                      onPressed: () => _onSearchChanged(""),
                    )
                  : null,
            ),
          ),
        ),
      ),

      // BODY WITH BANNER AT BOTTOM
      body: Column(
        children: [
          Expanded(
            child: allWords.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.searchNotFound(query),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    itemCount: visibleWords.length +
                        (visibleWords.length < allWords.length ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == visibleWords.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child:
                              Center(child: CircularProgressIndicator()),
                        );
                      }

                      final word = visibleWords[index];
                      return ExpandableWordCard(
                        word: word,
                        isFav: favProvider.isFavourite(word),
                        onFavTap: () =>
                            favProvider.toggleFavourite(word),
                        tts: _tts,
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
