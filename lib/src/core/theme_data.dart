import 'package:astro_talk/src/core/colors.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headline1: const TextStyle(
      color: Colors.white,
      letterSpacing: 0.40,
      fontFamily: "HelveticaNeue-Medium",
      fontSize: 20,
    ),
    headline2: TextStyle(
      color: Colors.grey.shade700,
      fontFamily: "HelveticaNeue_Italic",
      fontWeight: FontWeight.w900,
      fontSize: 16,
    ),
    headline3: const TextStyle(
      color: Colors.white,
      fontFamily: "HelveticaNeue",
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      height: 1.5,
      fontSize: 16,
    ),
    headline4: const TextStyle(
      color: Colors.white,
      letterSpacing: 0.6,
      fontFamily: "HelveticaNeueLight",
      fontSize: 12,
    ),
    headline6: const TextStyle(
      color: Colors.grey,
      fontFamily: "HelveticaNeueLight",
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
      fontSize: 10,
    ),
    headline5: const TextStyle(
      color: Colors.black,
      fontFamily: "HelveticaNeueLight",
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
      fontSize: 14,
    ),
  ),
  scaffoldBackgroundColor: AppColors.appWhiteColor,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColors.appBlueColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 0.40,
      fontFamily: "HelveticaNeue-Medium",
      fontSize: 20,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: MaterialStateBorderSide.resolveWith(
        (_) => BorderSide(width: 1, color: AppColors.appGreyColor)),
    fillColor: MaterialStateProperty.all(Colors.white),
    checkColor: MaterialStateProperty.all(Colors.blueAccent),
  ),
  unselectedWidgetColor: AppColors.appGreyColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius:  BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Colors.black54
      ),
    ),
  )
); //grey
