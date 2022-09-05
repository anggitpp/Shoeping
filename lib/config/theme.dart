import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color backgroundColor = '#161616'.toColor();
Color mainColor = '#E8FB7A'.toColor();
Color secondaryColor = '#808D9E'.toColor();
Color darkGreyColor = '#262832'.toColor();
Color lighterBlack = '#1B1B1B'.toColor();
Color darkerBlack = '#161616'.toColor();
Color lightGrey = '#262626'.toColor();
Color orangeColor = '#FFAC0C'.toColor();

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
);

TextStyle smallMediumText =
    GoogleFonts.inter().copyWith(fontSize: 12, color: secondaryColor);
TextStyle smallText =
    GoogleFonts.inter().copyWith(fontSize: 12, color: secondaryColor);
TextStyle mediumText =
    GoogleFonts.inter().copyWith(fontSize: 14, color: secondaryColor);
TextStyle mediumLightText = GoogleFonts.inter()
    .copyWith(fontSize: 14, color: secondaryColor, fontWeight: FontWeight.w300);
TextStyle mediumMediumText = GoogleFonts.inter()
    .copyWith(fontSize: 14, color: secondaryColor, fontWeight: FontWeight.w500);
TextStyle largeText =
    GoogleFonts.inter().copyWith(fontSize: 16, color: secondaryColor);
TextStyle largeLightText = GoogleFonts.inter()
    .copyWith(fontSize: 16, color: secondaryColor, fontWeight: FontWeight.w300);
TextStyle extraLargeText = GoogleFonts.poppins()
    .copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);
TextStyle extraLargeTitleText = GoogleFonts.inter()
    .copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);
TextStyle veryLargeText = GoogleFonts.poppins()
    .copyWith(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);
