import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color backgroundColor = '#161616'.toColor();
Color yellowColor = '#E8FB7A'.toColor();
Color secondaryColor = '#808D9E'.toColor();

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
);

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
