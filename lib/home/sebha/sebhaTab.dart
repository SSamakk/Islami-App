import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/AppProvider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double finalAngle = 0.0;
  int count = 0;
  int index = 0;
  int reset = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    List<String> tasbeh = [
      AppLocalizations.of(context)!.subhanAllah,
      AppLocalizations.of(context)!.alhamdullah,
      AppLocalizations.of(context)!.allahuakbar
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// sebha
        InkWell(
          onTap: () {
            finalAngle += 0.7;
            count += 1;
            reset += 1;
            if (reset == 33) {
              if (index < tasbeh.length - 1) {
                index += 1;
              } else {
                index = 0;
              }
              reset = 0;
            }
            setState(() {});
          },
          child: Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                /// head of sebha
                Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1),
                    child: Image.asset(provider.isDark()
                        ? 'assets/images/head_sebha_dark.png'
                        : 'assets/images/head_sebha_logo.png')),

                /// body of sebha (rotates)
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1),
                  child: Transform.rotate(
                      angle: finalAngle,
                      origin: const Offset(0, 0),
                      child: Image.asset(provider.isDark()
                          ? 'assets/images/body_sebha_dark.png'
                          : 'assets/images/body_sebha_logo.png')),
                ),
              ],
            ),
          ),
        ),

        /// Title 'nb of tasbeh'
        Text(
          AppLocalizations.of(context)!.tasbehNumber,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        /// counter
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? const Color.fromRGBO(20, 26, 46, 0.8)
                : const Color.fromRGBO(183, 147, 95, 0.57),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '$count',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),

        /// word of tasbeh
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? MyTheme.yellowColor
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            tasbeh[index],
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: MyTheme.blackColor)
                : Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: MyTheme.whiteLight),
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        )
      ],
    );
  }
}
