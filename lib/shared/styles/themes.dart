import 'package:flutter/material.dart';

import 'color.dart';


class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: PRIMARY_COLOR,
    scaffoldBackgroundColor: GREEN_BACKGROUND,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: PRIMARY_COLOR,
        onPrimary: WHITE_COLOR,
        secondary: GREEN_COLOR,
        onSecondary: WHITE_COLOR,
        error: Colors.red,
        onError: WHITE_COLOR,
        background: GREEN_BACKGROUND,
        onBackground: BLACK_COLOR,
        surface: BLACK_COLOR,
        onSurface: BLACK_COLOR),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: WHITE_COLOR),
      centerTitle: false,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: WHITE_COLOR,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: PRIMARY_COLOR,
      ),
      subtitle2: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: GREEN_COLOR,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PRIMARY_COLOR,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: WHITE_COLOR,
      unselectedItemColor: Colors.grey,
      selectedItemColor: PRIMARY_COLOR,
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    primaryColor: PRIMARY_DARK,
    scaffoldBackgroundColor: BLACK_COLOR,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: PRIMARY_COLOR,
        onPrimary: BLACK_COLOR,
        secondary: GREEN_COLOR,
        onSecondary: WHITE_COLOR,
        error: Colors.red,
        onError: WHITE_COLOR,
        background: GREEN_BACKGROUND,
        onBackground: BLACK_COLOR,
        surface: WHITE_COLOR,
        onSurface: WHITE_COLOR),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: BLACK_COLOR),
      iconTheme: IconThemeData(color: BLACK_COLOR),
      centerTitle: false,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: WHITE_COLOR,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: PRIMARY_COLOR,
      ),
      subtitle2: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: GREEN_COLOR,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:PRIMARY_COLOR ,
      unselectedItemColor: Colors.grey,
      selectedItemColor: WHITE_COLOR,
    ),
  );
}
