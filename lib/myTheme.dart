import 'package:flutter/material.dart';

class MyTheme {
  // colors
  static Color primaryLight = const Color(0xffB7935F);
  static Color blackColor = const Color(0xff242424);
  static Color whiteLight = Colors.white;

  // colors for dark
  static Color whiteDark = const Color(0xffF8F8F8);
  static Color yellowColor = const Color(0xffFACC1D);
  static Color primaryDark = const Color(0xff141A2E);

  // light mode theme
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,

      /// app bar theme
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: blackColor,
            fontSize: 30,
          ),
          iconTheme: IconThemeData(color: blackColor)),

      /// bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor,
          unselectedItemColor: whiteLight,
          selectedLabelStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: blackColor),
          selectedIconTheme: const IconThemeData(size: 36),
          unselectedIconTheme: const IconThemeData(size: 36)
          // backgroundColor: primaryLight,
          ),

      /// drop down menu theme
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
        inputDecorationTheme: InputDecorationTheme(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        menuStyle:
            MenuStyle(backgroundColor: WidgetStatePropertyAll(primaryLight)),
      ),

      /// text themes
      textTheme: TextTheme(
        // table titles
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: blackColor),
        // table content
        titleSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: blackColor),
        // content
        bodyLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
      ));

  // dark mode theme
  static ThemeData darkMode = ThemeData(
      primaryColor: primaryDark,
      scaffoldBackgroundColor: Colors.transparent,

      /// app bar theme
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: whiteDark,
            fontSize: 30,
          ),
          iconTheme: IconThemeData(color: whiteDark)),

      /// bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellowColor,
          unselectedItemColor: whiteDark,
          selectedLabelStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: yellowColor),
          selectedIconTheme: const IconThemeData(size: 36),
          unselectedIconTheme: const IconThemeData(size: 36)
          // backgroundColor: primaryLight,
          ),

      /// text themes
      textTheme: TextTheme(
        // table titles
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: whiteDark),
        // table content
        titleSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: whiteDark),
        // content
        bodyLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: whiteDark),
      ));
}
