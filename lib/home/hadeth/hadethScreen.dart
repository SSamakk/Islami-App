import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../providers/AppProvider.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'hadethScreen';

  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> lines = [];
  String title = '';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    int argsIndex = ModalRoute.of(context)?.settings.arguments as int;

    if (lines.isEmpty) {
      loadFile(argsIndex);
    }

    return Stack(children: [
      Image.asset(
        provider.isDark()
            ? 'assets/images/dark_bg.png'
            : 'assets/images/default_bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: const Text('Islami'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.06,
          ),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? const Color.fromRGBO(20, 26, 46, 0.8)
                : const Color.fromRGBO(248, 248, 248, 0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              /// title
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Divider(
                color: provider.isDark()
                    ? MyTheme.yellowColor
                    : Theme.of(context).primaryColor,
                thickness: 1,
              ),

              /// hadeth
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      lines[index],
                      style: Theme.of(context).textTheme.bodyLarge,
                      textDirection: TextDirection.rtl,
                    );
                  },
                  itemCount: lines.length,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  /// read from file
  void loadFile(index) async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadeth = content.split('#\r\n');

    lines = hadeth[index].split('\n');
    title = lines[0];
    lines.removeAt(0);
    setState(() {});
  }
}
