import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/phrase_word.dart';
import '../services/device_service.dart';

class FavouritesProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _deviceId;

  final List<PhraseWord> _favourites = [];

  List<PhraseWord> get favourites => _favourites;

  bool isFavourite(PhraseWord word) {
    return _favourites.any((w) => w.nepali == word.nepali);
  }

  // 🔥 Init
  Future<void> init() async {
    _deviceId = await DeviceService.getDeviceId();
    await loadFavourites();
  }

  Future<void> loadFavourites() async {
    if (_deviceId == null) return;

    final snapshot = await _firestore
        .collection("favourites")
        .doc(_deviceId)
        .collection("words")
        .get();

    _favourites.clear();

    for (var doc in snapshot.docs) {
      _favourites.add(
        PhraseWord(
          nepali: doc["nepali"],
          pronunciation: doc["pronunciation"],
          meaning: doc["meaning"],
          thaiMeaning: doc["thaiMeaning"],
        ),
      );
    }
    notifyListeners();
  }

  Future<void> toggleFavourite(PhraseWord word) async {
    if (_deviceId == null) return;

    final docRef = _firestore
        .collection("favourites")
        .doc(_deviceId)
        .collection("words")
        .doc(word.nepali);

    if (isFavourite(word)) {
      await docRef.delete();
      _favourites.removeWhere((w) => w.nepali == word.nepali);
    } else {
      await docRef.set({
        "nepali": word.nepali,
        "pronunciation": word.pronunciation,
        "meaning": word.meaning,
        "thaiMeaning": word.thaiMeaning,
      });
      _favourites.add(word);
    }

    notifyListeners();
  }
}
