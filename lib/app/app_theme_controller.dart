import 'package:flutter/material.dart';

class AppThemeController extends ChangeNotifier {
  Brightness _themeMode = Brightness.light;
  Brightness get themeMode => _themeMode;

  void switchTheme(Brightness? value) {
    if (value != null) {
      _themeMode = value;
    } else {
      _themeMode = Brightness.light;
    }
    notifyListeners();
  }
}
