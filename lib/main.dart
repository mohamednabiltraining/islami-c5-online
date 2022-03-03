import 'package:flutter/material.dart';
import 'package:islami_c5_online/home_screen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {HomeScreen.routeName: (buildContext) => HomeScreen()},
      initialRoute: HomeScreen.routeName,
    );
  }
}
