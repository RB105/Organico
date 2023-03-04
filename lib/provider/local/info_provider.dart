import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier {
  // Variables
  List<Map<String, dynamic>> wishList = [];

  void addToWishList(Map<String, dynamic> element) {
    if (wishList.contains(element)) {
      wishList.remove(element);
      notifyListeners();
    } else {
      wishList.add(element);
      notifyListeners();
    }
  }
}
