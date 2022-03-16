import 'package:flutter/material.dart';
import 'package:islami_c5_online/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class LocaleBottomSheet extends StatefulWidget {
  @override
  State<LocaleBottomSheet> createState() => _LocaleBottomSheetState();
}

class _LocaleBottomSheetState extends State<LocaleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var localeProvider = Provider.of<LocaleProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              localeProvider.changeLocale('en');
            },
            child: getLanguageWidget(
                'English', localeProvider.currentLocale == 'en'),
          ),
          InkWell(
            onTap: () {
              localeProvider.changeLocale('ar');
            },
            child: getLanguageWidget(
                'العربيه', localeProvider.currentLocale == 'ar'),
          )
        ],
      ),
    );
  }

  Widget getLanguageWidget(String title, bool isSelected) {
    if (isSelected) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          Icon(Icons.check, color: Theme.of(context).colorScheme.onBackground)
        ]),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      ]),
    );
  }
}
