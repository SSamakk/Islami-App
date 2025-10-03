import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/settings/LanguageBottomSheet.dart';
import 'package:islami/myTheme.dart';
import 'package:islami/providers/AppProvider.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import 'ThemeBottomSheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.12,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Language list
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          /// drop menu for language
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    width: 2,
                    color: provider.isDark()
                        ? MyTheme.yellowColor
                        : Theme.of(context).primaryColor),
              ),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.en
                        : AppLocalizations.of(context)!.ar,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: provider.isDark()
                        ? MyTheme.whiteDark
                        : MyTheme.blackColor,
                  ),
                ],
              ),
            ),
          ),

          /// space
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          /// Theme list
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          /// drop menu for theme
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      width: 2,
                      color: provider.isDark()
                          ? MyTheme.yellowColor
                          : Theme.of(context).primaryColor)),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: provider.isDark()
                        ? MyTheme.whiteDark
                        : MyTheme.blackColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}
