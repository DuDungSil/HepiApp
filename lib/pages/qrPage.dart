import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../store/user.dart';

class qrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x1A000000),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.watch<user>().name,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.5,
                              color: Color(0xFF000000),
                            ),
                          ),
                          Text(
                            '추천인 코드: AAA000',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.5,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            '내 정보 설정',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.3,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Container(
                          width: 5,
                          height: 10,
                          child: SizedBox(
                            width: 5,
                            height: 10,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_91_x2.svg',
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
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                'QR코드 스캔',
                style: GoogleFonts.getFont(
                  'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  height: 1.3,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x1A000000)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/images/image.jpeg',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                child: Text(
                  '보유 포인트',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.3,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '사용 가능한 쿠폰',
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
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '포인트 적립',
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '내 리워드',
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
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '할인 정보',
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Container(
                child: Text(
                  '보유 품목 목록',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.3,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              height: 280,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 160,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                'assets/images/image_1.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  'Optimum Nutrition, 더블 리치 초콜릿 Whey,  2.27kg(5lb)',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.3,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  '400/454g (12%)',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    height: 1.5,
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
                  Container(
                    width: 160,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                'assets/images/image_7.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  'Life Extension, 투 퍼 데이 종합 비타민 캡슐 120 정',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.3,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  '100/120정 (17%)',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    height: 1.5,
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
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                'assets/images/image_5.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  'California Gold Nutrition, 오메가3 프리미엄 피쉬 오일, 피쉬 젤라틴 소프트젤 100정',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.3,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Text(
                                  '35/100정 (65%)',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    height: 1.5,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
