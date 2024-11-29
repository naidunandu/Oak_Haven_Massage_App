import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColors {
  static const Color primary = Color(0xFF224436);
  static const Color secondary = Color(0xFF61677D);
  static const Color background = Color(0xFFF6FFFC);
  static const Color link = Color(0xFF33B790);
  static const Color placeholder = Color(0xFFF3FBF6);
  static const Color border = Color(0xFFB9B9B9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteLight = Color(0xFFF5F5F5);
  static const Color error = Color(0xFFD44B4B);
  static const Color success = Color(0xFF27AE60);
  static const Color black = Color(0xFF000000);
}

ThemeData themeData = ThemeData(
  useMaterial3: false,
  popupMenuTheme: const PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: CustomColors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
  ),
  textTheme: GoogleFonts.interTextTheme(),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: CustomColors.primary,
    secondary: CustomColors.secondary,
    surface: CustomColors.white,
    onSurface: CustomColors.black,
    onError: CustomColors.white,
    onPrimary: CustomColors.white,
    onSecondary: CustomColors.white,
    error: CustomColors.error,
  ),
);

InputBorder? border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    width: 1,
    color: CustomColors.border,
  ),
);
