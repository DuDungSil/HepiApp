import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/getMyProduct.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../function/getRecommendProduct.dart';

class Bottombar extends StatelessWidget {
  Bottombar({Key? key, this.setTab }) : super(key: key);
  final setTab;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // 바텀 앱바
      height: 50,
      padding: EdgeInsets.all(0),
      child: Container(
        // 바텀 전체 컨테이너
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(0, 0),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          // 바텀 앱바 레이아웃
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell( // 홈 버튼
              onTap: () {
                setTab(0);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🏠',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.4,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    child: Text(
                      '홈',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell( // 검색 버튼
              onTap: () {
                setTab(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🔍',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.4,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    child: Text(
                      '검색',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell( // 마이페이지 버튼
              onTap: () {
                setTab(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '👤',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.4,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    child: Text(
                      '마이페이지',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell( //채팅 버튼
              onTap: () {
                setTab(3);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '💬',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.4,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    child: Text(
                      '채팅',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(// QR 코드 인식 버튼
              onTap: () {
                setTab(4);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🔍',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.4,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    child: Text(
                      'QR코드 인식',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.4,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
