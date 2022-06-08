import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'categories';

  //method to create category
  void createCategory(String name) {
    var id = const Uuid();
    String categoryId = id.v1();

    _firestore.collection(ref).doc(categoryId).set({'category': name});
  }

  //method to get categories from database
  Future<List<DocumentSnapshot>> getCategories() {
    return _firestore.collection(ref).get().then((snaps) {
      return snaps.docs;
    });
  }
}
