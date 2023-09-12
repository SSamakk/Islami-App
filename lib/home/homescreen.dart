import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadethTab.dart';
import 'package:islami/home/quraan/quraanTab.dart';
import 'package:islami/home/radio/radioTab.dart';
import 'package:islami/home/sebha/sebhaTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuraanTab(), HadethTab(), SebhaTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// background
        Image.asset(
          'assets/images/default_bg.png',
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
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: 'قرآن',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: 'حديث',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: 'سبحة',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: 'راديو',
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('إسلامي'),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
