import 'package:flutter/material.dart';
import 'package:islami_c5_online/sura_details/sura_details.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(index, name));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
