import 'package:flutter/material.dart';
import 'package:islami/home/homescreen.dart';
import 'package:islami/home/quraan/suraScreen.dart';
import 'package:islami/myTheme.dart';
import 'package:islami/providers/AppProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth/hadethScreen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  // preferences
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => AppConfigProvider(
      dark: prefs.getBool('darkMode') ?? false,
      english: prefs.getBool('english') ?? true,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);

    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraScreen.routeName: (context) => const SuraScreen(),
        HadethScreen.routeName: (context) => const HadethScreen(),
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
