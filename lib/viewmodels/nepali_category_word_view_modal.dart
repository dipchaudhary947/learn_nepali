import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/nepali_category_word_view_class_model.dart';
import '../utils/data/phrases_categories_data.dart';

class NepaliCategoryWordViewModal {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadOnce() async {
    final docRef = _firestore.collection('categories').doc('phrases');
    final snapshot = await docRef.get();

    if (snapshot.exists) return;

    // 🔥 Convert Dart objects → Firestore JSON
    final data = categoriesData.map((e) => e.toMap()).toList();

    await docRef.set({
      "data": data,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  Future<List<NepaliCategoryWordViewClassModel>> fetchCategories() async {
    final doc = await _firestore.collection('categories').doc('phrases').get();

    if (!doc.exists) return [];

    final List<dynamic> list = doc.get('data');

    return list
        .map((e) => NepaliCategoryWordViewClassModel.fromMap(e))
        .toList();
  }
}
