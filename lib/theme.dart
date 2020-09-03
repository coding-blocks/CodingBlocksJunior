import 'package:coding_blocks_junior/utils/HexToColor.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryBlue = getColorFromHex("#194A88");
final accentColor = getColorFromHex("#056FDE");

final fs = SizeConfig.textMultiplier;

ThemeData buildTheme(context) => ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryBlue,
    accentColor: accentColor,
    textTheme: GoogleFonts.muliTextTheme().copyWith(
        headline1: TextStyle(color: primaryBlue, fontSize: 32 * fs),
        headline2: TextStyle(color: primaryBlue, fontSize: 30 * fs),
        headline3: TextStyle(color: primaryBlue, fontSize: 28 * fs),
        headline4: TextStyle(
            color: primaryBlue, fontSize: 26 * fs, fontWeight: FontWeight.w600),
        headline5: TextStyle(color: primaryBlue, fontSize: 24 * fs),
        headline6: TextStyle(fontSize: 22 * fs, fontWeight: FontWeight.w600),
        subtitle1: TextStyle(color: primaryBlue, fontSize: 16 * fs),
        subtitle2: TextStyle(color: primaryBlue, fontSize: 14 * fs),
        bodyText1: TextStyle(fontSize: 16 * fs),
        bodyText2: TextStyle(fontSize: 14 * fs),
        caption: TextStyle(fontSize: 12 * fs)),
    buttonTheme: ButtonThemeData(
        buttonColor: getColorFromHex('#045bc7'),
        textTheme: ButtonTextTheme.primary),
    inputDecorationTheme:
    InputDecorationTheme(labelStyle: TextStyle(color: accentColor)),
    visualDensity: VisualDensity.adaptivePlatformDensity);


final YtPlayerIconTheme = ({Widget child}) => IconTheme(
  data: IconThemeData(
    color: Colors.white, size: 16 * SizeConfig.imageSizeMultiplier,
  ),
  child: child,
);