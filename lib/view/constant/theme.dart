import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness:  Brightness.light
    // ),

    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  scaffoldBackgroundColor: Colors.transparent,
);
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff000051),
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    actionsIconTheme: IconThemeData(color: Colors.white),
  ),
);
