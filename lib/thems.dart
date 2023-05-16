import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.cyan,
      primaryColor: Colors.black,
      cardColor: const Color.fromARGB(255, 134, 222, 137),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.cyan,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black))
      // textTheme: CustomTextTheme.textThemeLight,
      );

  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      bottomAppBarColor: Colors.deepPurple,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.deepPurple,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)));
}
