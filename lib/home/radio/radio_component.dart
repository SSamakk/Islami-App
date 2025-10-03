import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/radios_model.dart';
import '../../l10n/app_localizations.dart';
import '../../myTheme.dart';
import '../../providers/AppProvider.dart';

class RadioComponent extends StatefulWidget {
  final Radios radio;
  final PageController controller;
  final int index;
  final int total;

  const RadioComponent({
    super.key,
    required this.radio,
    required this.controller,
    required this.index,
    required this.total,
  });

  @override
  State<RadioComponent> createState() => _RadioComponentState();
}

class _RadioComponentState extends State<RadioComponent> {
  late AudioPlayer audioPlayer;
  bool playing = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Text(
          widget.radio.name ?? "NONE",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Skip Previous
            IconButton(
              icon: Icon(
                AppLocalizations.of(context)!.localeName == 'ar'
                    ? Icons.skip_next
                    : Icons.skip_previous,
                size: 45,
              ),
              color: provider.isDark()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
              onPressed: () {
                if (widget.index > 0) {
                  widget.controller.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),

            // Play & Pause Button
            IconButton(
              icon: playing
                  ? const Icon(Icons.pause, size: 70)
                  : const Icon(Icons.play_arrow_rounded, size: 70),
              color: provider.isDark()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (playing) {
                    stop();
                  } else {
                    play();
                  }
                  playing = !playing;
                });
              },
            ),

            // Skip Next
            IconButton(
              icon: Icon(
                AppLocalizations.of(context)!.localeName == 'ar'
                    ? Icons.skip_previous
                    : Icons.skip_next,
                size: 45,
              ),
              color: provider.isDark()
                  ? MyTheme.yellowColor
                  : Theme.of(context).primaryColor,
              onPressed: () {
                if (widget.index < widget.total - 1) {
                  widget.controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  void play() async {
    await audioPlayer.play(UrlSource(widget.radio.url ?? ''));
  }

  void stop() async {
    await audioPlayer.stop();
  }
}
