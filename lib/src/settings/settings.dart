import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  @override
  ThemeData setTheme(bool) {
    if (bool == true) {
      notifyListeners();
      return ThemeData.dark();
    } else {
      notifyListeners();
      return ThemeData.light();
    }
  }
}
