import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  // data
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  bool dark;
  bool english;

  AppConfigProvider({required this.dark, required this.english}) {
    appTheme = dark ? ThemeMode.dark : ThemeMode.light;
    appLanguage = english ? 'en' : 'ar';
  }

  // methods
  void changeLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;

    prefs.setBool('english', appLanguage == 'en' ? true : false);

    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;

    prefs.setBool('darkMode', appTheme == ThemeMode.dark ? true : false);

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
