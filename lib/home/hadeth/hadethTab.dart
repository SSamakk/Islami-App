import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadethScreen.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/AppProvider.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    List<String> hadeth = [];

    // list of hadeth titles in table
    for (int i = 0; i < 50; i++) {
      AppLocalizations.of(context)!.localeName == 'ar'
          ? hadeth.add('حديث رقم ${i + 1}')
          : hadeth.add('Hadeth #${i + 1}');
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: provider.isDark()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadethName,
            style: Theme.of(context).textTheme.titleMedium),
        Divider(
          color: provider.isDark()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  HadethScreen.routeName,
                  arguments: index,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  hadeth[index],
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          itemCount: hadeth.length,
        ))
      ],
    );
  }
}
