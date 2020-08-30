import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryBlue = getColorFromHex("#194A88");

final ThemeData appThemeData = new ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    accentColor: primaryBlue,
    textTheme: GoogleFonts.muliTextTheme().copyWith(
      headline1: TextStyle(color: primaryBlue, fontSize: 32),
      headline2: TextStyle(color: primaryBlue, fontSize: 30),
      headline3: TextStyle(color: primaryBlue, fontSize: 28),
      headline4: TextStyle(color: primaryBlue, fontSize: 26, fontWeight: FontWeight.w600),
      headline5: TextStyle(color: primaryBlue, fontSize: 24),
      headline6: TextStyle(color: primaryBlue, fontSize: 22, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(color: primaryBlue, fontSize: 14),
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(color: primaryBlue, fontSize: 12),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: getColorFromHex('#045bc7'),
        textTheme: ButtonTextTheme.primary),
    visualDensity: VisualDensity.adaptivePlatformDensity);
