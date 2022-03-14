import 'package:flutter/material.dart';
import 'package:islami_c5_online/home/Ahadeth/hadeth_tab.dart';
import 'package:islami_c5_online/home/Ahadeth/item_verse_hadeth.dart';

import '../../sura_details/item_verse.dart';

class HadethDetails extends StatelessWidget {
  static String ROUTE_NAME = "hadeth details";
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute
        .of(context)!
        .settings
        .arguments as Hadeth;
    verses=hadeth.content;
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            appBar: AppBar(
              title: Text(
                '${hadeth.title}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1,
              ),
              centerTitle: true,
            ),
            body: verses.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemBuilder: (_, index) {
                return ItemVerseHadeth(verses[index]);
              },
              itemCount: verses.length,
            ),
        )
      ],
    );
  }
}
