import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.light.white,
      foregroundColor: AppColor.light.darkGrey,
      iconTheme: IconThemeData(color: AppColor.light.primaryColor),
      centerTitle: true,
      titleTextStyle: textTheme.displayLarge!.apply(
        color: AppColor.light.darkGrey,
        // fontSizeDelta: 18,
      ),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent,
      // ),
    ),
    primaryColor: AppColor.light.primaryColor,
    scaffoldBackgroundColor: AppColor.light.white,
    textTheme: textTheme,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(AppColor.light.primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    primaryTextTheme: textTheme,
    splashColor: AppColor.light.primaryColor,
    extensions: const <ThemeExtension<dynamic>>[
      AppColor.light,
    ],
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.light.primaryColor,
        surface: AppColor.light.backgroundColor,
        onSurface: AppColor.light.lightGrey,
        error: AppColor.light.errorColor,
        background: AppColor.light.white,
        onBackground: AppColor.light.lightGrey,
        onPrimary: AppColor.light.primaryColor,
        secondary: AppColor.light.secondaryColor,
        onError: AppColor.light.errorColor,
        onSecondary: AppColor.light.mistGrey),
  );

  static TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColor.light.darkGrey,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColor.light.darkGrey,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColor.light.darkGrey,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.light.darkGrey,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: AppColor.light.darkGrey,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: AppColor.light.darkGrey,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColor.light.lightGrey,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColor.light.lightGrey,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 10,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColor.light.lightGrey,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColor.light.darkGrey,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColor.light.darkGrey,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColor.light.darkGrey,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: AppColor.light.lightGrey,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 14,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: AppColor.light.lightGrey,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 12,
      height: 1.5,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
      color: AppColor.light.lightGrey,
    ),
  );
}
