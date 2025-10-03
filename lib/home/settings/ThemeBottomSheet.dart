import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/AppProvider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
          /// Light
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: provider.isDark()
                ? getUnselectedWidget(
                    AppLocalizations.of(context)!.light, provider)
                : getSelectedWidget(
                    AppLocalizations.of(context)!.light, provider),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),

          /// Dark
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: provider.isDark()
                ? getSelectedWidget(
                    AppLocalizations.of(context)!.dark, provider)
                : getUnselectedWidget(
                    AppLocalizations.of(context)!.dark, provider),
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
