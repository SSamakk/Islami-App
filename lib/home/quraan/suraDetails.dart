import 'package:flutter/material.dart';

class SuraDetails extends StatelessWidget {
  String content;
  int index;

  SuraDetails({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content {${index + 1}}',
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.start,
      textDirection: TextDirection.rtl,
    );
  }
}
