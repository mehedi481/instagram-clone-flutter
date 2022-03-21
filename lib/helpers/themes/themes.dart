import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;

Color kPrimaryColor = Colors.blue.shade600.withOpacity(0.85);

SystemUiOverlayStyle uiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: kPrimaryColor,
);

ThemeData theme = ThemeData(
  appBarTheme: appBarTheme,
  backgroundColor: white,
  fontFamily: GoogleFonts.roboto().fontFamily,
  iconTheme: iconThemeData,
  inputDecorationTheme: inputDecorationTheme,
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: kPrimaryColor,
  elevation: 0.0,
  toolbarTextStyle: const TextTheme(
    headline6: TextStyle(
      fontSize: 20,
    ),
  ).bodyText2,
  titleTextStyle: const TextTheme(
    headline6: TextStyle(
      fontSize: 20,
    ),
  ).headline6,
);

IconThemeData iconThemeData = IconThemeData(color: kPrimaryColor);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  border: outlineInputBorder,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  gapPadding: 10,
);

const BoxDecoration tabDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

TextStyle tsSize(double x) => TextStyle(fontSize: x);

TextStyle tsBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold);

TextStyle tsColorBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold, color: kPrimaryColor);
