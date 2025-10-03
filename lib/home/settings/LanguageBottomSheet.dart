import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/AppProvider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.2,
      color: provider.isDark()
          ? Theme.of(context).primaryColor
          : MyTheme.whiteLight,
      child: Column(
        children: [
          /// English
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: provider.appLanguage == 'en'
                ? getSelectedWidget(AppLocalizations.of(context)!.en, provider)
                : getUnselectedWidget(
                    AppLocalizations.of(context)!.en, provider),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),

          /// Arabic
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedWidget(AppLocalizations.of(context)!.ar, provider)
                : getUnselectedWidget(
                    AppLocalizations.of(context)!.ar, provider),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text, var provider) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Icon(
            Icons.check_box,
            color: provider.isDark() ? MyTheme.whiteDark : MyTheme.blackColor,
          ),
        ],
      ),
    );
  }

  Widget getUnselectedWidget(String text, var provider) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Icon(
            Icons.check_box_outline_blank,
            color: provider.isDark() ? MyTheme.whiteDark : MyTheme.blackColor,
          ),
        ],
      ),
    );
  }
}
