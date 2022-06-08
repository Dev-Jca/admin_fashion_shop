import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class BrandService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = 'brands';

//method to create brands
  void createBrand(String name) {
    var id = const Uuid();
    String brandId = id.v1();

    _firestore.collection(ref).doc(brandId).set({'brand': name});
  }

//method to get brands from database
  Future<List<DocumentSnapshot>> getBrands() {
    return _firestore.collection(ref).get().then((snaps) {
      return snaps.docs;
    });
  }
}
