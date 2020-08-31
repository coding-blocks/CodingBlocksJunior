import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryBlue = getColorFromHex("#194A88");

final fs = SizeConfig.textMultiplier;

ThemeData buildTheme(context) => ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    accentColor: primaryBlue,
    fontFamily: 'Gilroy',
    textTheme: GoogleFonts.muliTextTheme().copyWith(
      headline1: TextStyle(color: primaryBlue, fontSize: 32 * fs),
      headline2: TextStyle(color: primaryBlue, fontSize: 30 * fs),
      headline3: TextStyle(color: primaryBlue, fontSize: 24 * fs),
      headline4: TextStyle(
          color: primaryBlue, fontSize: 20 * fs, fontWeight: FontWeight.w600),
      headline5: TextStyle(color: primaryBlue, fontSize: 18 * fs),
      headline6: TextStyle(
          color: primaryBlue, fontSize: 14 * fs, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(color: primaryBlue, fontSize: 12 * fs),
      subtitle2: TextStyle(color: getColorFromHex('#1D4479'), fontSize: 12 * fs, ),
      bodyText1: TextStyle(color: primaryBlue, fontSize: 12 * fs),
      bodyText2: TextStyle(color: primaryBlue, fontSize: 10 * fs),
      button: TextStyle(
          color: Colors.white, fontSize: 12 * fs, fontWeight: FontWeight.w600),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: getColorFromHex('#045bc7'),
        textTheme: ButtonTextTheme.primary),
    visualDensity: VisualDensity.adaptivePlatformDensity);
