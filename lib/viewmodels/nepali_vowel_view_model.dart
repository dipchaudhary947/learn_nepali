import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_nepali/models/nepali_vowel_class_modal.dart';
import 'package:learn_nepali/utils/data/nepali_vowels_data.dart';

class NepaliVowelViewModel {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   // Upload only once
  Future<void> uploadOnce() async {
    print("🔥 Checking if Nepali vowel exist...");

    final docRef = _firestore.collection('vowel').doc('nepali');
    final snapshot = await docRef.get();

    if (snapshot.exists) {
      print("✅ Nepali vowel already exist");
      return;
    }

    await docRef.set({
      "data": nepaliVowelsData,
      "createdAt": FieldValue.serverTimestamp(),
    });

    print("🔥 Nepali vowel uploaded to Firestore");
  }

  // Fetch consonants
  Future<List<NepaliVowelClassModal>> fetchVowel() async {
    final doc =
        await _firestore.collection('vowel').doc('nepali').get();

    if (!doc.exists) { 
      print("❌ No data found in Firestore");
      return [];
    }

    final List list = doc.get('data');

    return list.map((e) => NepaliVowelClassModal.fromMap(e)).toList();
  }


}