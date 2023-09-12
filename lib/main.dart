import 'package:flutter/material.dart';
import 'package:islami/home/homescreen.dart';
import 'package:islami/home/quraan/suraScreen.dart';
import 'package:islami/myTheme.dart';

import 'home/hadeth/hadethScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
      theme: MyTheme.lightMode,
    );
  }
}
