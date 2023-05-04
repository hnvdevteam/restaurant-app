import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppColor.white,
  fontFamily: "Metropolis",
  primarySwatch: Colors.red,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        AppColor.greenAccent,
      ),
      shape: MaterialStateProperty.all(
        StadiumBorder(),
      ),
      elevation: MaterialStateProperty.all(0),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        AppColor.greenAccent,
      ),
    ),
  ),
  textTheme: TextTheme(
    headline3: TextStyle(
      color: AppColor.primary,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: AppColor.secondary,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline5: TextStyle(
      color: AppColor.primary,
      fontWeight: FontWeight.normal,
      fontSize: 25,
    ),
    headline6: TextStyle(
      color: AppColor.primary,
      fontSize: 25,
    ),
    bodyText2: TextStyle(
      color: AppColor.secondary,
    ),
  ),
);
