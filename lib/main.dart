import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/homescreen.dart';
import 'package:islami/home/quraan/suraScreen.dart';
import 'package:islami/myTheme.dart';
import 'package:islami/providers/AppProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth/hadethScreen.dart';

void main() async {
  // preferences
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => AppConfigProvider(
      dark: prefs.getBool('darkMode') ?? false,
      english: prefs.getBool('english') ?? true,
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);

    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },

      /// Theme
      theme: provider.isDark() ? MyTheme.darkMode : MyTheme.lightMode,

      /// Language
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
