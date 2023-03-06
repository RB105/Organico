import 'package:flutter/material.dart';

class InfoProvider extends ChangeNotifier {
  // Variables
  int counter = 1;
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

  void deleteFromWishList(
      Map<String, dynamic> element, List<Map<String, dynamic>> list) {
    list.remove(element);
    wishList.remove(element);
    notifyListeners();
  }

  void decrement() {
    if (counter < 2) {
      counter = 1;
      notifyListeners();
    } else {
      counter--;
      notifyListeners();
    }
  }

  void increment() {
    counter++;
    notifyListeners();
  }
}
