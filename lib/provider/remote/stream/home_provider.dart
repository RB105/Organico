import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // Streams
  Stream<QuerySnapshot> products = FirebaseFirestore.instance
      .collection('products')
      .orderBy('created_at')
      .snapshots();

  Stream<QuerySnapshot> bestSellingProducts = FirebaseFirestore.instance
      .collection('bestSelling')
      .orderBy('created_at')
      .snapshots();

  Stream<QuerySnapshot> coupons = FirebaseFirestore.instance
      .collection('coupons')
      .orderBy('created_at')
      .snapshots();

  List<Map<String, dynamic>> searchList = [];
}
