import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Qr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
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
                          'assets/vectors/wifi_6_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: SvgPicture.asset(
                          'assets/vectors/cellular_7_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8.6, 0),
                      child: SizedBox(
                        width: 9,
                        height: 14,
                        child: SvgPicture.asset(
                          'assets/vectors/battery_6_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 1.9, 0, 1.9),
                      child: SizedBox(
                        width: 33.6,
                        height: 10.2,
                        child: SvgPicture.asset(
                          'assets/vectors/time_2_x2.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 12, 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 12, 4),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'LEE YUN GU',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.5,
                              color: Color(0xFF000000),
                            ),
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
                  margin: EdgeInsets.fromLTRB(0, 13, 0, 13),
                  padding: EdgeInsets.fromLTRB(7, 2, 6, 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF000000)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 6.8, 0),
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
                        margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
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
            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  '바코드/QR 스캔',
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
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 12, 28),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'QR Code',
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/image.jpeg',
                                ),
                              ),
                            ),
                            child: Container(
                              width: 75,
                              height: 73,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Barcode',
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
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/image_1.jpeg',
                              ),
                            ),
                          ),
                          child: Container(
                            width: 140,
                            height: 71,
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
            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Align(
              alignment: Alignment.topLeft,
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
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
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
                    padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
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
            margin: EdgeInsets.fromLTRB(12, 0, 12, 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
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
                    padding: EdgeInsets.fromLTRB(11, 11, 11, 11),
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
            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Align(
              alignment: Alignment.topLeft,
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
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 0, 0, 12),
            child: SizedBox(
              width: 466,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                              width: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x0D000000),
                                ),
                                child: SizedBox(
                                  width: 150,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 67, 0, 67),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Text(
                                          'Product 1',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.3,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                        Positioned(
                                          right: -189,
                                          bottom: -186,
                                          child: Container(
                                            width: 339,
                                            height: 336,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x0D000000),
                                              ),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(0, 157, 0, 157),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Text(
                                                        'Coffee Mug',
                                                        style: GoogleFonts.getFont(
                                                          'Roboto',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16,
                                                          height: 1.4,
                                                          color: Color(0xFF000000),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                'assets/images/image_3.png',
                                                              ),
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 153,
                                                            height: 160,
                                                          ),
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
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(7, 0, 10.3, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                    child: Text(
                                      'California Gold Nutrition, Sport, 분리유청단백질, 무맛, 454g(1lb) ',
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
                                    margin: EdgeInsets.fromLTRB(0, 0, 6.7, 0),
                                    child: Text(
                                      '400g/454g (12%)',
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
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                        padding: EdgeInsets.fromLTRB(7, 165, 3.3, 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: -18,
                              top: -165,
                              child: SizedBox(
                                height: 158,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x0D000000),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 63, 0, 63),
                                        child: Text(
                                          'Product 2',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.3,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -177,
                                      bottom: -14,
                                      child: Container(
                                        width: 177,
                                        height: 172,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x0D000000),
                                          ),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(0, 78, 0, 78),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Text(
                                                    'Image 2',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: -1,
                                                    top: -2.8,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/images/image_2.png',
                                                          ),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: 165,
                                                        height: 167,
                                                      ),
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
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                  child: Text(
                                    'Life Extension, 투 퍼 데이'
                                '종합 비타민 캡슐 120 정  ',
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
                                  margin: EdgeInsets.fromLTRB(0, 0, 17.1, 0),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 150,
                      height: 241,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x0D000000),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 67, 0, 67),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Text(
                                        'Product 3',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 16,
                                        top: 0,
                                        bottom: -7,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                'assets/images/image_5.png',
                                              ),
                                            ),
                                          ),
                                          child: Container(
                                            width: 134,
                                            height: 157,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            bottom: 7,
                            child: SizedBox(
                              height: 76,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      'California Gold Nutrition, 오메가3 프리미엄 피쉬 오일, 피쉬 젤라틴 소프트젤 100정',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      bottom: 0,
                                      child: SizedBox(
                                        height: 24,
                                        child: Text(
                                          ' 35/100정',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            height: 1.5,
                                            color: Color(0xFF000000),
                                          ),
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
                  ),
                ],
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
    );
  }
}