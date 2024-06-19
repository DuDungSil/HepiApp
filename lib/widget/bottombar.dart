import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/getProduct.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return BottomAppBar(
      // 바텀 앱바
      height: 50,
      padding: EdgeInsets.all(0),
      color: Colors.white,
      elevation: 0,
      child: Container(
        // 바텀 전체 컨테이너
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // 테두리 색상
              width: 0.3, // 테두리 두께
            ),
          ),
        ),
        child: Row(
          // 바텀 앱바 레이아웃
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                // 홈 버튼
                onTap: () {
                  setTab(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/vectors/Bottombar/home_icon.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                        '홈',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          height: 1.4,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                // 검색 버튼
                onTap: () {
                  setTab(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/vectors/Bottombar/search_icon.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                        '검색',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          height: 1.4,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                // 마이페이지 버튼
                onTap: () {
                  setTab(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/vectors/Bottombar/mypage_icon.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                        '마이페이지',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          height: 1.4,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                //채팅 버튼
                onTap: () {
                  if (context.read<user>().id == null) {
                    // showTopSnackBar(
                    //   Overlay.of(context),
                    //   CustomSnackBar.error(
                    //     message: '로그인 후 이용해주세요',
                    //   ),
                    //   displayDuration: Duration(milliseconds: 500),
                    // );
                    setTab(3);
                  } else {
                    setTab(3);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/vectors/Bottombar/healthy_icon.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                        '건강 관리',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          height: 1.4,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                // QR 코드 인식 버튼
                onTap: () {
                  setTab(4);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/vectors/Bottombar/qr_icon.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                        'QR코드 인식',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          height: 1.4,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}