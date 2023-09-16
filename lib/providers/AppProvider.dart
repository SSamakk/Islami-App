import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  // data
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  // methods
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    if (appTheme == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}
