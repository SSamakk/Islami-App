import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/quraan/suraDetails.dart';
import 'package:islami/myTheme.dart';
import 'package:provider/provider.dart';

import '../../providers/AppProvider.dart';

class SuraScreen extends StatefulWidget {
  static const String routeName = 'suraScreen';

  const SuraScreen({super.key});

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> verse = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraScreenArgs;
    if (verse.isEmpty) {
      loadFile(args.index);
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
              Text(
                args.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Divider(
                color: provider.isDark()
                    ? MyTheme.yellowColor
                    : Theme.of(context).primaryColor,
                thickness: 1,
              ),
              verse.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: provider.isDark()
                              ? MyTheme.yellowColor
                              : Theme.of(context).primaryColor,
                        ),
                      ))
                  : Expanded(
                      child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SuraDetails(
                          content: verse[index],
                          index: index,
                        );
                      },
                      itemCount: verse.length,
                    )),
            ],
          ),
        ),
      ),
    ]);
  }

  /// read from files
  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verse = lines;
    setState(() {});
  }
}

// data class
class SuraScreenArgs {
  String name;
  int index;

  SuraScreenArgs({required this.name, required this.index});
}
