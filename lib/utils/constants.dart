import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const String APP_NAME = "Hepi";
  static const double APPBAR_TITLE_HEIGHT = 50;
  static const double APPBAR_CONTENT_HEIGHT = 40;
  static const EdgeInsets SCREEN_HORIZONTAL_MARGIN = EdgeInsets.symmetric(horizontal: 20);

  static const text13 = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const text15 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle text17 = GoogleFonts.getFont(
    'Roboto Condensed',
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle text20 = GoogleFonts.getFont(
  'Roboto Condensed',
  fontWeight: FontWeight.w600,
  fontSize: 20,
  height: 1.2,
  letterSpacing: -0.5,
  );

  static Widget defalutErrorWidget = Icon(Icons.error);
  static Widget defalutProgressIndicatorWidget = CircularProgressIndicator();
}
