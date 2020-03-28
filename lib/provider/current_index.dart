import 'package:flutter/material.dart';

class CurrentIndexProvider with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }

  void clearAll() {
    this.currentIndex = 0;
  }
}