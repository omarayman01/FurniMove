import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primarylight = const Color(0xff242424);
  static Color blackText = const Color(0xff303030);
  static Color grey = const Color(0xff606060);
  static Color white = const Color(0xffFFFFFF);
  static Color lightGrey = const Color(0xff99999B);
  static Color dividerGrey = const Color(0xffE0E0E0);
  static Color dividerblack = const Color(0xff505050);
  static Color green = const Color(0xff32CD32);
  static Color red = const Color(0xffE44235);

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        displayLarge: GoogleFonts.gelasio(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackText),
        displayMedium: GoogleFonts.merriweather(
            fontSize: 24, fontWeight: FontWeight.bold, color: blackText),
        displaySmall: GoogleFonts.gelasio(
            fontSize: 18, fontWeight: FontWeight.w600, color: lightGrey),
        headlineLarge: GoogleFonts.nunitoSans(
            fontSize: 20, fontWeight: FontWeight.bold, color: blackText),
        bodyLarge: GoogleFonts.nunitoSans(
            fontSize: 18, fontWeight: FontWeight.w600, color: white),
        bodyMedium: GoogleFonts.nunitoSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: blackText),
        bodySmall: GoogleFonts.nunitoSans(
            fontSize: 14, color: grey, fontWeight: FontWeight.w400),
        titleSmall: GoogleFonts.archivoBlack(
            fontSize: 14, fontWeight: FontWeight.w600, color: blackText)),
    primaryColor: blackText,
    scaffoldBackgroundColor: white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primarylight,
      selectedItemColor: white,
      unselectedItemColor: const Color(0xff999999),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.kanit(
            fontSize: 20, fontWeight: FontWeight.bold, color: blackText)),
  );
}
