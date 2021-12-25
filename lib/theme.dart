import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.sourceSansPro(
      textStyle: const TextStyle(
        fontSize: 27,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      primaryColor: const Color(0xff125386),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      textTheme: lightTextTheme,
    );
  }
}
