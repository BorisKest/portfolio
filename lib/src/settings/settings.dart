import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  ThemeData setTheme(boolValue) {
    if (boolValue == true) {
      notifyListeners();
      return ThemeData.dark();
    } else {
      notifyListeners();
      return ThemeData.light();
    }
  }
}
