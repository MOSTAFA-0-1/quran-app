import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "kit"),
      headline5: TextStyle(
        fontSize: 20,
        color: Colors.grey,
      ),
      headline6: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold,fontFamily: "kit"),
      subtitle1: TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(
        fontSize: 15,
        color: Colors.grey,
      ),
      bodyText1: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "kit"),
    ),
    primaryColor: const Color.fromRGBO(46, 187, 196, 1),
    buttonTheme: const ButtonThemeData(
      buttonColor:  Color.fromRGBO(46, 187, 196, 1),
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor:  Color.fromRGBO(46, 187, 196, 1),
    ),
  );
}
