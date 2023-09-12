import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadethScreen.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> hadeth = [];
    for (int i = 0; i < 50; i++) {
      hadeth.add('حديث رقم ${i + 1}');
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text('الأحاديث', style: Theme.of(context).textTheme.titleMedium),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(HadethScreen.routeName,
                    arguments: HadethDetailsArgs(index: index));
              },
              child: Text(
                hadeth[index],
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            );
          },
          itemCount: hadeth.length,
        ))
      ],
    );
  }
}
