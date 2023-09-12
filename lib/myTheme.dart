import 'package:flutter/material.dart';

class MyTheme {
  // colors
  static Color primaryLight = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Colors.white;

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
          unselectedItemColor: whiteColor,
          selectedLabelStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 36)
          // backgroundColor: primaryLight,
          ),

      /// text themes
      textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: blackColor),
        titleSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: blackColor),
        bodyLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
      ));
}
