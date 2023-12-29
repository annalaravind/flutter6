import 'package:flutter/material.dart';
import 'package:flutter_todo/theme/theme.dart';

class ThemeUser extends ChangeNotifier {
  ThemeData oneOfThemeData = lightMode;
  set settingThemeData(ThemeData themeData) {
    oneOfThemeData = themeData;
    notifyListeners();
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeData get gettingThemeData => oneOfThemeData;

  void toggleOnTap() {
    _isDarkMode = !_isDarkMode;
    if (oneOfThemeData == lightMode) {
      settingThemeData = darkMode;
    } else {
      settingThemeData = lightMode;
    }
  }
}
