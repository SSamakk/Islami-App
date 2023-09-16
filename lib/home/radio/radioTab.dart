import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../providers/AppProvider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset('assets/images/radio_image.png')),
        Text(
          AppLocalizations.of(context)!.radio_station,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous,
              size: 45,
              color: provider.isDark()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 70,
              color: provider.isDark()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
            ),
            Icon(
              Icons.skip_next,
              size: 45,
              color: provider.isDark()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
