import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_nepali/models/nepali_consonants_class_modal.dart';
import 'package:learn_nepali/utils/data/nepali_consonants.dart';

class NepaliConsonantsViewModel {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   // Upload only once
  Future<void> uploadOnce() async {
    print("🔥 Checking if Nepali consonants exist...");

    final docRef = _firestore.collection('consonants').doc('nepali');
    final snapshot = await docRef.get();

    if (snapshot.exists) {
      print("✅ Nepali consonants already exist");
      return;
    }

    await docRef.set({
      "data": nepaliConsonantsData,
      "createdAt": FieldValue.serverTimestamp(),
    });

    print("🔥 Nepali consonants uploaded to Firestore");
  }

  // Fetch consonants
  Future<List<NepaliConsonantsClassModal>> fetchConsonants() async {
    final doc =
        await _firestore.collection('consonants').doc('nepali').get();

    if (!doc.exists) {
      print("❌ No data found in Firestore");
      return [];
    }

    final List list = doc.get('data');

    return list.map((e) => NepaliConsonantsClassModal.fromMap(e)).toList();
  }


}