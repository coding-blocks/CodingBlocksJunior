import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryBlue = getColorFromHex("#194A88");

final fs = 1.0; // SizeConfig.textMultiplier

ThemeData buildTheme (context) => ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    accentColor: primaryBlue,
    textTheme: GoogleFonts.muliTextTheme().copyWith(
      headline1: TextStyle(color: primaryBlue, fontSize: 32 * fs),
      headline2: TextStyle(color: primaryBlue, fontSize: 30 * fs),
      headline3: TextStyle(color: primaryBlue, fontSize: 28 * fs),
      headline4: TextStyle(color: primaryBlue, fontSize: 26 * fs, fontWeight: FontWeight.w600),
      headline5: TextStyle(color: primaryBlue, fontSize: 24 * fs),
      headline6: TextStyle(color: primaryBlue, fontSize: 22 * fs, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(color: primaryBlue, fontSize: 14 * fs),
      bodyText1: TextStyle(fontSize: 14 * fs),
      bodyText2: TextStyle(color: primaryBlue, fontSize: 12 * fs),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: getColorFromHex('#045bc7'),
        textTheme: ButtonTextTheme.primary),
    visualDensity: VisualDensity.adaptivePlatformDensity);
