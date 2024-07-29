import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const String APP_NAME = "Hepi";
  static const double APPBAR_TITLE_HEIGHT = 50;
  static const double APPBAR_CONTENT_HEIGHT = 40;
  static const double BOTTOM_MARGIN_WITH_BAR = 80;
  static const double BOTTOM_MARGIN_WITHOUT_BAR = 20;
  static const EdgeInsets SCREEN_HORIZONTAL_MARGIN = EdgeInsets.symmetric(horizontal: 20);

  static getPretendardTxt(double _fontSize, Color _color) {
    return TextStyle(
      color: _color,
      fontSize: _fontSize,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w400,
      height: 1.1,
      letterSpacing: -0.5,
    );
  }

  static getRobotoTxt(double _fontSize, Color _color) {
    return GoogleFonts.getFont(
      color: _color,
      fontSize: _fontSize,
      'Roboto Condensed',
      fontWeight: FontWeight.w600,
      height: 1.1,
      letterSpacing: -0.5,
    );
  }

  static getLineTxt(double _fontSize, Color _color) {
    return TextStyle(
      color: _color,
      decorationColor: _color,
      fontSize: _fontSize,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w400,
      height: 1.1,
      letterSpacing: -0.5,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 2.0, // 선의 두께를 설정
    );
  }

  static Widget defalutErrorWidget = Icon(Icons.error);
  static Widget defalutProgressIndicatorWidget = CircularProgressIndicator();
}
