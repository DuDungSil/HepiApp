import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class cartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(11, 17.2, 13.7, 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(23.5, 0, 0, 29.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0.4),
                    width: 28.4,
                    height: 11.1,
                    child: SizedBox(
                      width: 28.4,
                      height: 11.1,
                      child: SvgPicture.network(
                        'assets/vectors/Unknown',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0.2, 0, 0),
                    child: SizedBox(
                      width: 66.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0.3, 5, 0.3),
                            child: SizedBox(
                              width: 17,
                              height: 10.7,
                              child: SvgPicture.network(
                                'assets/vectors/Unknown',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0.4),
                            child: SizedBox(
                              width: 15.3,
                              height: 11,
                              child: SvgPicture.network(
                                'assets/vectors/Unknown',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SizedBox(
                              width: 24.3,
                              height: 11.3,
                              child: SvgPicture.network(
                                'assets/vectors/Unknown',
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 7, 15, 7),
                      width: 10,
                      height: 18,
                      child: SizedBox(
                        width: 10,
                        height: 18,
                        child: SvgPicture.network(
                          'assets/vectors/Unknown',
                        ),
                      ),
                    ),
                    Text(
                      '기본 정보 입력',
                      style: GoogleFonts.getFont(
                        'Work Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        height: 1,
                        color: Color(0xFF323F4B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(23, 0, 22.3, 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: SizedBox(
                              height: 79,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 103.1,
                                      height: 58,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 8.1, 0),
                                                    child: Text(
                                                      '생년월일',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        height: 1.7,
                                                        letterSpacing: 0.1,
                                                        color:
                                                            Color(0xFF101010),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 9, 0, 9.2),
                                                    child: SizedBox(
                                                      width: 11.4,
                                                      height: 5.8,
                                                      child: SvgPicture.network(
                                                        'assets/vectors/Unknown',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '2000년 01월 01일',
                                            style: GoogleFonts.getFont(
                                              'Urbanist',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 1.7,
                                              letterSpacing: 0.1,
                                              color: Color(0xFF101010),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3F3F3),
                                      ),
                                      child: Container(
                                        width: 170,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 30.6, 9, 28),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: -5,
                                  top: -30.6,
                                  child: Container(
                                    height: 24,
                                    child: Text(
                                      '성별',
                                      style: GoogleFonts.getFont(
                                        'Urbanist',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        height: 1.7,
                                        letterSpacing: 0.1,
                                        color: Color(0xFF101010),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: -5,
                                  right: -9,
                                  bottom: -28,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF3F3F3),
                                    ),
                                    child: Container(
                                      width: 170,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 16, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF000000),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 2.5, 1, 2.9),
                                              child: Text(
                                                '남성',
                                                style: GoogleFonts.getFont(
                                                  'Work Sans',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  height: 1,
                                                  letterSpacing: 1.3,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFC4C4C4),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 2.5, 1, 2.9),
                                              child: Text(
                                                '여성',
                                                style: GoogleFonts.getFont(
                                                  'Work Sans',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  height: 1,
                                                  letterSpacing: 1.3,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                    margin: EdgeInsets.fromLTRB(0, 0, 2, 18.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0.1, 18, 0),
                            child: SizedBox(
                              height: 79,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 56.6,
                                      height: 58,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Text(
                                              '신장(cm)',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 17, 0),
                                            child: Text(
                                              '170cm',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3F3F3),
                                      ),
                                      child: Container(
                                        width: 170,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0.1),
                            child: SizedBox(
                              height: 79,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 65.7,
                                      height: 58,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Text(
                                              '몸무게(kg)',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '80kg',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3F3F3),
                                      ),
                                      child: Container(
                                        width: 170,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 17.7),
                    child: SizedBox(
                      height: 79,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(274, 5.3, 0, 69.4),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -274,
                              top: -5.3,
                              child: SizedBox(
                                width: 123.2,
                                height: 58,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '내 지역 설정',
                                          style: GoogleFonts.getFont(
                                            'Urbanist',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            height: 1.7,
                                            letterSpacing: 0.1,
                                            color: Color(0xFF101010),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '지역을 설정해주세요.',
                                      style: GoogleFonts.getFont(
                                        'Urbanist',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.7,
                                        letterSpacing: 0.1,
                                        color: Color(0xFF101010),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: -274,
                              right: 0,
                              bottom: -69.4,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF3F3F3),
                                ),
                                child: Container(
                                  width: 360,
                                  height: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                              height: 4.4,
                              child: SvgPicture.network(
                                'assets/vectors/Unknown',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 18.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0.4, 20, 0),
                            child: SizedBox(
                              height: 79,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(24, 9, 0, 64.2),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: -24,
                                      top: -9,
                                      child: SizedBox(
                                        width: 85,
                                        height: 58,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 10),
                                              child: Text(
                                                '제품 섭취 목적',
                                                style: GoogleFonts.getFont(
                                                  'Urbanist',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                  height: 1.7,
                                                  letterSpacing: 0.1,
                                                  color: Color(0xFF101010),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 4.3, 0),
                                              child: Text(
                                                '선택해주세요.',
                                                style: GoogleFonts.getFont(
                                                  'Urbanist',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.7,
                                                  letterSpacing: 0.1,
                                                  color: Color(0xFF101010),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -24,
                                      right: 0,
                                      bottom: -64.2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF3F3F3),
                                        ),
                                        child: Container(
                                          width: 170,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                      height: 5.8,
                                      child: SvgPicture.network(
                                        'assets/vectors/Unknown',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0.4),
                            child: SizedBox(
                              height: 79,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SizedBox(
                                      width: 111,
                                      height: 58,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Text(
                                              '주로 섭취하는 제품',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '선택해주세요.',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3F3F3),
                                      ),
                                      child: Container(
                                        width: 170,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 18.1),
                    child: SizedBox(
                      width: 360,
                      height: 79,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 152.7,
                              height: 58,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 6, 0),
                                            child: Text(
                                              '운동 빈도 설정',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 9, 0, 9.2),
                                            child: SizedBox(
                                              width: 12,
                                              height: 5.8,
                                              child: SvgPicture.network(
                                                'assets/vectors/Unknown',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '운동 수준을 설정해주세요.',
                                    style: GoogleFonts.getFont(
                                      'Urbanist',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.7,
                                      letterSpacing: 0.1,
                                      color: Color(0xFF101010),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                              ),
                              child: Container(
                                width: 360,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 18.1),
                    child: SizedBox(
                      width: 360,
                      height: 79,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 152.7,
                              height: 58,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 6, 0),
                                            child: Text(
                                              '운동 수준 설정',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 9, 0, 9.2),
                                            child: SizedBox(
                                              width: 12,
                                              height: 5.8,
                                              child: SvgPicture.network(
                                                'assets/vectors/Unknown',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '운동 수준을 설정해주세요.',
                                    style: GoogleFonts.getFont(
                                      'Urbanist',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.7,
                                      letterSpacing: 0.1,
                                      color: Color(0xFF101010),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                              ),
                              child: Container(
                                width: 360,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 18.1),
                    child: SizedBox(
                      width: 360,
                      height: 79,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 152.7,
                              height: 58,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 6, 0),
                                            child: Text(
                                              '운동 목적 설정',
                                              style: GoogleFonts.getFont(
                                                'Urbanist',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                height: 1.7,
                                                letterSpacing: 0.1,
                                                color: Color(0xFF101010),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 9, 0, 9.2),
                                            child: SizedBox(
                                              width: 12,
                                              height: 5.8,
                                              child: SvgPicture.network(
                                                'assets/vectors/Unknown',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '운동 수준을 설정해주세요.',
                                    style: GoogleFonts.getFont(
                                      'Urbanist',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.7,
                                      letterSpacing: 0.1,
                                      color: Color(0xFF101010),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                              ),
                              child: Container(
                                width: 360,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    height: 79,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                            width: 152.7,
                            height: 58,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 6, 0),
                                          child: Text(
                                            '운동 유형 설정',
                                            style: GoogleFonts.getFont(
                                              'Urbanist',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              height: 1.7,
                                              letterSpacing: 0.1,
                                              color: Color(0xFF101010),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 9, 0, 9.2),
                                          child: SizedBox(
                                            width: 12,
                                            height: 5.8,
                                            child: SvgPicture.network(
                                              'assets/vectors/Unknown',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  '운동 수준을 설정해주세요.',
                                  style: GoogleFonts.getFont(
                                    'Urbanist',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.7,
                                    letterSpacing: 0.1,
                                    color: Color(0xFF101010),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F3F3),
                            ),
                            child: Container(
                              width: 360,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF161616)),
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF161616),
                  ),
                  child: Container(
                    width: 341,
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                    child: Text(
                      '입력 완료',
                      style: GoogleFonts.getFont(
                        'Work Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        height: 1,
                        letterSpacing: 1.3,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
