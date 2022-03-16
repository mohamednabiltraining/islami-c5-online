import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c5_online/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: getThemeWidget(AppLocalizations.of(context)!.light,
                  !themeProvider.isDark())),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
              child: getThemeWidget(
                  AppLocalizations.of(context)!.dark, themeProvider.isDark())),
        ],
      ),
    );
  }

  Widget getThemeWidget(String title, bool isSelected) {
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
