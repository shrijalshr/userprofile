// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class AppColor extends ThemeExtension<AppColor> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color darkGrey;
  final Color lightGrey;
  final Color mistGrey;
  final Color whiteSmoke;
  final Color white;
  final Color successColor;
  final Color errorColor;
  final Color infoColor;
  final Color warningColor;

  const AppColor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.darkGrey,
    required this.lightGrey,
    required this.mistGrey,
    required this.whiteSmoke,
    required this.white,
    required this.successColor,
    required this.errorColor,
    required this.infoColor,
    required this.warningColor,
  });

  @override
  ThemeExtension<AppColor> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? darkGrey,
    Color? lightGrey,
    Color? mistGrey,
    Color? whiteSmoke,
    Color? white,
    Color? successColor,
    Color? errorColor,
    Color? infoColor,
    Color? warningColor,
  }) {
    return AppColor(
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        darkGrey: darkGrey ?? this.darkGrey,
        lightGrey: lightGrey ?? this.lightGrey,
        mistGrey: mistGrey ?? this.mistGrey,
        whiteSmoke: whiteSmoke ?? this.whiteSmoke,
        white: white ?? this.white,
        successColor: successColor ?? this.successColor,
        errorColor: errorColor ?? this.errorColor,
        infoColor: infoColor ?? this.infoColor,
        warningColor: warningColor ?? this.warningColor);
  }

  @override
  ThemeExtension<AppColor> lerp(ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) return this;

    return AppColor(
      primaryColor:
          Color.lerp(primaryColor, other.primaryColor, t) ?? primaryColor,
      secondaryColor:
          Color.lerp(secondaryColor, other.secondaryColor, t) ?? secondaryColor,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t) ?? darkGrey,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t) ?? lightGrey,
      mistGrey: Color.lerp(mistGrey, other.mistGrey, t) ?? mistGrey,
      white: Color.lerp(white, other.white, t) ?? white,
      whiteSmoke: Color.lerp(whiteSmoke, other.whiteSmoke, t) ?? whiteSmoke,
      successColor:
          Color.lerp(successColor, other.successColor, t) ?? successColor,
      errorColor: Color.lerp(errorColor, other.errorColor, t) ?? errorColor,
      infoColor: Color.lerp(infoColor, other.infoColor, t) ?? infoColor,
      warningColor:
          Color.lerp(warningColor, other.warningColor, t) ?? warningColor,
    );
  }

  static const AppColor light = AppColor(
    primaryColor: Color(0xff584cf4),
    secondaryColor: Color(0xffffc529),
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    darkGrey: Color(0xff1A1D26),
    lightGrey: Color.fromARGB(255, 158, 162, 172),
    mistGrey: Color.fromARGB(0, 194, 194, 194),
    whiteSmoke: Color.fromARGB(255, 248, 249, 253),
    white: Color(0xffffffff),
    successColor: Color.fromARGB(255, 49, 207, 70),
    errorColor: Color(0xffFC4141),
    infoColor: Color(0xff2F80ED),
    warningColor: Color(0xffEE961B),
  );
}
