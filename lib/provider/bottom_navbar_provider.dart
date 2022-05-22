import 'package:flutter/material.dart';

class BottomNavBarNotfier with ChangeNotifier {
  String _sort = "all";

  String get sort => _sort;

  set sort(String newValue) {
    _sort = newValue;
    notifyListeners();
  }
}
