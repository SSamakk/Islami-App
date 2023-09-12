import 'package:flutter/material.dart';

class HadethDetails extends StatelessWidget {
  String content;

  HadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content',
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.start,
      textDirection: TextDirection.rtl,
    );
  }
}
