import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter/app/app.dart';

/// A list of styles used all over the application.
abstract class Styles {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    backgroundColor: Colors.white,
    fontFamily: GoogleFonts.asap().fontFamily,
    primaryColor: ColorsValue.primaryColor,
    primarySwatch: const MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    accentColor: ColorsValue.accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: elevatedButtonStyle,
    textButtonTheme: textButtonStyle,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.light,
    backgroundColor: ColorsValue.darkBackgroundColor,
    fontFamily: GoogleFonts.asap().fontFamily,
    primaryColor: ColorsValue.primaryColor,
    primarySwatch: const MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    accentColor: ColorsValue.accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: elevatedButtonStyle,
    textButtonTheme: textButtonStyle,
  );

  static TextStyle white15 = GoogleFonts.asap(
    fontSize: Dimens.ten + Dimens.five,
    color: Colors.white,
  );

  static TextStyle white14 = GoogleFonts.asap(
    fontSize: Dimens.ten + Dimens.four,
    color: Colors.white,
  );

  static TextStyle themeBold20 = GoogleFonts.asap(
    fontSize: Dimens.twenty,
    color: ColorsValue.themeOppositeColor(),
    fontWeight: FontWeight.bold,
  );

  static TextStyle theme15 = GoogleFonts.asap(
    fontSize: Dimens.ten + Dimens.five,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle theme12 = GoogleFonts.asap(
    fontSize: Dimens.ten + Dimens.two,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle bold30 = GoogleFonts.asap(
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeColor(),
  );

  static TextStyle themeBold30 = GoogleFonts.asap(
    fontSize: Dimens.ten + Dimens.twenty,
    fontWeight: FontWeight.bold,
    color: ColorsValue.themeOppositeColor(),
  );

  static TextStyle whiteBold30 = GoogleFonts.asap(
    fontSize: Dimens.ten + Dimens.twenty,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static ElevatedButtonThemeData elevatedButtonStyle = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: ColorsValue.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.thirty,
        ),
      ),
      padding: Dimens.edgeInsets15_15_15_15,
    ),
  );

  static TextButtonThemeData textButtonStyle = TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.transparent,
      elevation: Dimens.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.thirty,
        ),
      ),
    ),
  );

  static IconThemeData iconThemeData = IconThemeData(
    color: Get.isDarkMode ? Colors.white : ColorsValue.darkBackgroundColor,
  );
}
