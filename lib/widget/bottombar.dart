import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/getProduct.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../store/user.dart';

class Bottombar extends StatelessWidget {
  Bottombar({Key? key, this.setTab}) : super(key: key);
  final setTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey, // 테두리 색상
            width: 0.3, // 테두리 두께
          ),
        ),
      ),
      child: BottomAppBar(
        // 바텀 앱바
        elevation: 0,
        height: 50,
        padding: EdgeInsets.all(0),
        color: Colors.white,
        child: Row(
          // 바텀 앱바 레이아웃
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              // 홈 버튼
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
            InkWell(
              // 검색 버튼
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
            InkWell(
              // 마이페이지 버튼
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
            InkWell(
              //채팅 버튼
              onTap: () {
                if (context.read<user>().id == null) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: '로그인 후 이용해주세요',
                    ),
                    displayDuration: Duration(milliseconds: 500),
                  );
                } else {
                  setTab(3);
                }
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
            InkWell(
              // QR 코드 인식 버튼
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
                      'QR코드',
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
