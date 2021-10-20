import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeAssets {
  ThemeAssets._();

  static TextTheme get textTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle? get headline1 => textTheme.headline1;
  static TextStyle? get headline2 => textTheme.headline2;
  static TextStyle? get headline3 => textTheme.headline3;
  static TextStyle? get headline4 => textTheme.headline4;
  static TextStyle? get headline5 => textTheme.headline5;
  static TextStyle? get headline6 => textTheme.headline6;

  static TextStyle? get subtitle1 => textTheme.subtitle1;
  static TextStyle? get subtitle2 => textTheme.subtitle2;

  static TextStyle? get bodyText1 => textTheme.bodyText1;
  static TextStyle? get bodyText2 => textTheme.bodyText2;

  static TextStyle? get button => textTheme.button;
  static TextStyle? get caption => textTheme.caption;
  static TextStyle? get overline => textTheme.overline;
}
