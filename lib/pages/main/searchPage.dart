import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/eclipseText.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class searchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 160),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
                  child: Container(
                    child: Text(
                      '최근 검색어',
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
                  // 최근 검색어 항목 건테이너
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            EclipseText(text: '삼대오백'),
                            EclipseText(text: '투퍼데이 종합비타민 120정'),
                            EclipseText(text: '잠백이 흑마늘'),
                            EclipseText(text: '프로틴'),
                            EclipseText(text: '크레아틴 500g'),
                          ],
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Container(
                    child: Text(
                      '자주 구매한 상품',
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
                  height: 280,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0x1A000000)),
                  child: Text(
                    "",
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.3,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        '할인 중인 상품',
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
                ),
                Container(
                  height: 280,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0x1A000000)),
                  child: Text(
                    "",
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.3,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                )
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
            height: 240,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Text(
                    '검색',
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
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // 배경색을 흰색으로 설정
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF9EA3B2), // 밑 선 색상을 회색으로 설정
                        width: 1,
                      ),
                    ),
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15, right: 15),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/vectors/search_normal_x2.svg',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '제품을 찾아보세요',
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              height: 1,
                              letterSpacing: -0.4,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // 배경색을 흰색으로 설정
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF9EA3B2), // 밑 선 색상을 회색으로 설정
                        width: 1,
                      ),
                    ),
                  ),
                  child: SearchBar(
                    hintText: '제품을 찾아보세요',
                    leading: Container(
                      margin: EdgeInsets.only(top: 15, right: 15),
                      width: 24,
                      height: 24,
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          'assets/vectors/search_normal_x2.svg',
                        ),
                      ),
                    ),
                    textStyle: WidgetStateProperty.all(
                      GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        height: 1,
                        letterSpacing: -0.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
