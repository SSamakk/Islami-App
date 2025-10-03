import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadethTab.dart';
import 'package:islami/home/quraan/quraanTab.dart';
import 'package:islami/home/radio/radioTab.dart';
import 'package:islami/home/sebha/sebhaTab.dart';
import 'package:islami/home/settings/SettingsTab.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/AppProvider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuraanTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        /// background
        Image.asset(
          provider.isDark()
              ? 'assets/images/dark_bg.png'
              : 'assets/images/default_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),

        /// app bar and navigation bar
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: AppLocalizations.of(context)!.quraan,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
