import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_nepali/models/nepali_number_class_modal.dart';
import 'package:learn_nepali/utils/data/nepali_numbers_data.dart';

class NepaliNumbersViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Test Firestore connection
  // Future<void> testConnection() async {
  //   try {
  //     await _firestore.collection('test').doc('ping').set({
  //       "time": FieldValue.serverTimestamp(),
  //     });
  //     print("🔥 Firestore connected successfully");
  //   } catch (e) {
  //     print("❌ Firestore connection failed: $e");
  //     throw e;
  //   }
  // }

  // Upload only once
  Future<void> uploadOnce() async {
    print("🔥 Checking if Nepali numbers exist...");

    final docRef = _firestore.collection('numbers').doc('nepali');
    final snapshot = await docRef.get();

    if (snapshot.exists) {
      print("✅ Nepali numbers already exist");
      return;
    }

    await docRef.set({
      "data": nepaliNumbersData,
      "createdAt": FieldValue.serverTimestamp(),
    });

    print("🔥 Nepali numbers uploaded to Firestore");
  }

  // Fetch numbers
  Future<List<NepaliNumberClassModal>> fetchNumbers() async {
    final doc =
        await _firestore.collection('numbers').doc('nepali').get();

    if (!doc.exists) {
      print("❌ No data found in Firestore");
      return [];
    }

    final List list = doc.get('data');

    return list.map((e) => NepaliNumberClassModal.fromMap(e)).toList();
  }
}
