import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_nepali/l10n/app_localizations.dart';
import 'package:learn_nepali/providers/nepali_consonants_provider.dart';
import 'package:learn_nepali/utils/admob/banner_ad_widget.dart';
import 'package:learn_nepali/utils/constants/app_colors.dart';
import 'package:provider/provider.dart';

class ConsonantsScreens extends StatefulWidget {
  const ConsonantsScreens({super.key});

  @override
  State<ConsonantsScreens> createState() => _ConsonantsScreensState();
}

class _ConsonantsScreensState extends State<ConsonantsScreens> {
  final FlutterTts _tts = FlutterTts();
  bool _isPlaying = false;
  int _currentIndex = -1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    await _tts.setLanguage("ne-NP");
    await _tts.setSpeechRate(0.4);
    await _tts.setVolume(1.0);
  }

  int _getSpeakDuration(String word) {
    return (word.length * 300) + 500;
  }

  Future<void> _playAll(List list) async {
    if (_isPlaying) return;

    _isPlaying = true;

    for (int i = 0; i < list.length; i++) {
      if (!_isPlaying) break;

      setState(() => _currentIndex = i);
      await _tts.stop();
      await _tts.speak(list[i].symbol);

      await Future.delayed(
        Duration(milliseconds: _getSpeakDuration(list[i].symbol)),
      );
    }

    _stop();
  }

  void _stop() {
    _isPlaying = false;
    _tts.stop();
    setState(() => _currentIndex = -1);
  }

  void _speakSingle(String text, int index) async {
    _stop();
    setState(() => _currentIndex = index);
    await _tts.speak(text);

    _timer?.cancel();
    _timer = Timer(
      Duration(milliseconds: _getSpeakDuration(text)),
      () => setState(() => _currentIndex = -1),
    );
  }

  @override
  void dispose() {
    _tts.stop();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<NepaliConsonantsProvider>().consonants;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.nepaliConsonants,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => _isPlaying ? _stop() : _playAll(data),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    _isPlaying ? Icons.stop : Icons.play_arrow,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // BODY WITH BANNER INSIDE
      body: Column(
        children: [
          // Main grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = data[index];
                final isActive = _currentIndex == index;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary.withOpacity(0.35)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isActive
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => _speakSingle(item.symbol, index),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.symbol,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(item.name),
                        ],
                      ),
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
