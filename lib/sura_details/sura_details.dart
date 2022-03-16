import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c5_online/providers/theme_provider.dart';
import 'package:islami_c5_online/sura_details/item_verse.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) loadFile(args.index);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(children: [
      Image.asset(
        themeProvider.getBackgroundImage(),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: verses.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (buildContext, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    height: 1,
                    color: Theme.of(buildContext).primaryColor,
                  );
                },
                itemBuilder: (_, index) {
                  return ItemVerse(verses[index]);
                },
                itemCount: verses.length,
              ),
      )
    ]);
  }

  void loadFile(int index) async {
    //int res = add(10,30);
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    print(lines);
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.index, this.name);
}
