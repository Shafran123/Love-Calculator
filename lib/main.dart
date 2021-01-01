import 'package:flutter/material.dart';
import 'package:love_calculator/loverDetailsScreen.dart';
import 'package:love_calculator/resultScreen.dart';
import 'package:love_calculator/startScreen.dart';
import 'package:love_calculator/youDetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
       routes: {
        YourDetailsScreen.routeName : (context) => YourDetailsScreen(),
        LoverDetailsScreen.routeName : (context) => LoverDetailsScreen(),
        ResultScreen.routeName : (content) => ResultScreen()
      },
    );
  }
}