import 'package:flutter/material.dart';
import 'package:islami_c5_online/home/Ahadeth/hadeth_details.dart';
import 'package:islami_c5_online/home/Ahadeth/hadeth_tab.dart';

class ItemHadehtName extends StatelessWidget {
  Hadeth hadeth;
  ItemHadehtName(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.ROUTE_NAME,
            arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          hadeth.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}