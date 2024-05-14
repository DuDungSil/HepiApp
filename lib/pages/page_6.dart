import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
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
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 8.7, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                                child: SizedBox(
                                  width: 18,
                                  height: 14,
                                  child: SvgPicture.asset(
                                    'assets/vectors/wifi_7_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                                child: SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: SvgPicture.asset(
                                    'assets/vectors/cellular_5_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 8.6, 0),
                                child: SizedBox(
                                  width: 9,
                                  height: 14,
                                  child: SvgPicture.asset(
                                    'assets/vectors/battery_3_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 1.9, 0, 1.9),
                                child: SizedBox(
                                  width: 33.6,
                                  height: 10.2,
                                  child: SvgPicture.asset(
                                    'assets/vectors/time_7_x2.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 12, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 3, 22, 3),
                                width: 10,
                                height: 18,
                                child: SizedBox(
                                  width: 10,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/shape_4_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 3, 15, 3),
                                width: 10,
                                height: 18,
                                child: SizedBox(
                                  width: 10,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/shape_x2.svg',
                                  ),
                                ),
                              ),
                              Text(
                                '투게더',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  height: 1.2,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                child: Text(
                                  '🔔',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '⚙️',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    '전주 원웨이 피트니스'
                  '🟢 현재 접속 중인 회원: 101명',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.4,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      padding: EdgeInsets.fromLTRB(11, 11, 0, 11),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x0D000000),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                child: Text(
                                  '📢',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    height: 1.6,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(
                              '센터 공지사항',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.1,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 11, 0, 11),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x0D000000),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                child: Text(
                                  '😎',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    height: 1.6,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text(
                              '내 프로필 설정',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.1,
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
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 19),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 31.2, 9),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x0D000000),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(13, 7, 13, 7),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(2.3, 0, 2.3, 1.3),
                                          child: SizedBox(
                                            width: 9.5,
                                            height: 9.5,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_1_x2.svg',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.1,
                                          height: 9.2,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_2_x2.svg',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '목표는삼대오백',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  '골드 뉴트리션 프로틴이랑 초코 프로틴 교환하실 분!',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.7,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1A000000),
                        ),
                        child: Container(
                          width: 336,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 19),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                            ),
                            child: SizedBox(
                              width: 40,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(13, 7, 13, 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(2.3, 0, 2.3, 1.3),
                                      child: SizedBox(
                                        width: 9.5,
                                        height: 9.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_6_x2.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.1,
                                      height: 9.2,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_12_x2.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '물근육입니다',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              '오늘 운동 같이 하실분 계신가요?',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.7,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1A000000),
                        ),
                        child: Container(
                          width: 336,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 19),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                            ),
                            child: SizedBox(
                              width: 40,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(13, 7, 13, 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(2.3, 0, 2.3, 1.3),
                                      child: SizedBox(
                                        width: 9.5,
                                        height: 9.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_13_x2.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.1,
                                      height: 9.2,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_9_x2.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 14.6, 0),
                              child: Text(
                                '하체운동만하는사람',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              '물근육님 운동 같이 하실래요?',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.7,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1A000000),
                        ),
                        child: Container(
                          width: 336,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 19),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                            ),
                            child: SizedBox(
                              width: 40,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(13, 7, 13, 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(2.3, 0, 2.3, 1.3),
                                      child: SizedBox(
                                        width: 9.5,
                                        height: 9.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_8_x2.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.1,
                                      height: 9.2,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_3_x2.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '헬린이공주',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              '이거 운동 어떻게 하는 줄 아시는 분ㅠㅠ',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.7,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1A000000),
                        ),
                        child: Container(
                          width: 336,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 19),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 12, 6),
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                            ),
                            child: SizedBox(
                              width: 40,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(13, 7, 13, 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(2.3, 0, 2.3, 1.3),
                                      child: SizedBox(
                                        width: 9.5,
                                        height: 9.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_x2.svg',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14.1,
                                      height: 9.2,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_5_x2.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '물근육입니다',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              '아 저 하체운동 어제 했습니다...',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.7,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1A000000),
                        ),
                        child: Container(
                          width: 336,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(14, 0, 17, 11),
              child: Container(
                padding: EdgeInsets.fromLTRB(13.2, 0, 0, 9),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '헬스장 주인',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  Text(
                                    '헬린이 공주님 도움 필요하시면 데스크로 문의 주세요!',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.7,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x0D000000),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(13, 7, 13, 7),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(2.3, 0, 2.3, 1.3),
                                          child: SizedBox(
                                            width: 9.5,
                                            height: 9.5,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_7_x2.svg',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.1,
                                          height: 9.2,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_4_x2.svg',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: -13.2,
                      right: 0,
                      bottom: -9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1A000000),
                        ),
                        child: Container(
                          width: 329,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x1A000000)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '메시지 입력...',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0x80000000),
                  ),
                ),
              ),
            ),
            Container(
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
              child: Container(
                padding: EdgeInsets.fromLTRB(26, 4, 9.8, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          margin: EdgeInsets.fromLTRB(5.4, 0, 5.4, 0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 39, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                margin: EdgeInsets.fromLTRB(0.8, 0, 0.8, 0),
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
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 39, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(13, 0, 13, 0),
                                child: Text(
                                  '👤',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    height: 1.4,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Text(
                                '마이페이지',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  height: 1.4,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 35.8, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                margin: EdgeInsets.fromLTRB(0.8, 0, 0.8, 0),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(16.2, 0, 16.2, 0),
                              child: Text(
                                '🔍',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  height: 1.4,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              'QR코드 인식',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                height: 1.4,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
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