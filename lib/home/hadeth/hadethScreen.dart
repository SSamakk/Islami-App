import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'hadethScreen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<String> verse = [];
  String title = '';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;
    if (verse.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      Image.asset(
        'assets/images/default_bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.06,
          ),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color.fromRGBO(248, 248, 248, 0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              verse.length == 0
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ))
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(
                            verse[index + 2],
                            style: Theme.of(context).textTheme.bodyLarge,
                            textDirection: TextDirection.rtl,
                          );
                        },
                        itemCount: verse.length - 2,
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
    List<String> lines = content.split('#');
    verse = lines[index].split('\n');
    title = verse[1];

    setState(() {});
  }
}

// data class
class HadethDetailsArgs {
  int index;

  HadethDetailsArgs({required this.index});
}
