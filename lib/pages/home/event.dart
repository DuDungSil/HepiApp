import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/eventImages.dart';
import '../../store/products.dart';
import '../../widget/priceText.dart';

class event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 160),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              // 전체 레이아웃
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  child: Container() // 미완성
                ),
                Container( // 필터
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
                  child: Container(
                    child: Text(
                      '할인 중인 품목',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.2,
                        letterSpacing: -0.5,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  // 물품 리스트
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 140,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                '진행 중인 이벤트',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 0,
                  letterSpacing: -0.5,
                  color: Color(0xFF111111),
                ),
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
