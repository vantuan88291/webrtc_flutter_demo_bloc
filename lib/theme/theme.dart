import 'package:flutter/material.dart';

import '../models/theme/theme_data.dart';
import 'colors.dart';
import 'colors.dart';

class CustomTheme {
  Color colorStatus1;
  Color colorStatus2;

  CustomTheme({this.colorStatus1, this.colorStatus2});

  factory CustomTheme.dark() {
    return CustomTheme(colorStatus1: Colors.red, colorStatus2: Colors.blue);
  }

  factory CustomTheme.light() {
    return CustomTheme(colorStatus1: Colors.white, colorStatus2: Colors.green);
  }

  static getCusTheme(THEME_MODE themeMode) {
    switch(themeMode) {
      case THEME_MODE.DARK:
        return CustomTheme.dark();
        break;
      case THEME_MODE.LIGHT:
        return CustomTheme.light();
        break;
      default:
        break;
    }
  }

}

final ThemeData lightThemeData = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  primaryColorDark: Colors.blueAccent,
  backgroundColor: Colors.white,
  textSelectionColor: Colors.black,
  accentColor: AppColor.blueLight,
  bottomAppBarColor: Colors.white,
  textSelectionHandleColor: Colors.white70,
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.red,
      fontFamily: 'abc'
    ),
  ),
);

final ThemeData darkThemeData = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.white30,
    primaryColorDark: Colors.white70,
    backgroundColor: Colors.black54,
    textSelectionHandleColor: Colors.white70,
    textSelectionColor: Colors.white60,
    accentColor: Colors.blueGrey,
    bottomAppBarColor: Colors.grey,
    textTheme: TextTheme(
        subtitle1: TextStyle(
            color: Colors.red,
            fontFamily: 'abc'
        )
    ).apply(
      bodyColor: AppColor.text
    )
);
