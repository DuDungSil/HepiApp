import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../function/getProduct.dart';
import '../function/moneyFormat.dart';
import '../store/products.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getProduct(context, "event");
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          // 전체 레이아웃
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // 로고 외곽선
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                margin: EdgeInsets.fromLTRB(16, 34, 0, 12),
                width: double.infinity,
                child: Text(
                  'HEPI ONLINE STORE',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.2,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              // 검색 창 외곽선
              margin: EdgeInsets.fromLTRB(12, 20, 12, 0),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x1A000000)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                // 검색 입력 필드 컨테이너
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '검색어를 입력하세요',
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0x80000000),
                        ),
                      ),
                    ),
                    Container(
                      // 검색 버튼
                      decoration: BoxDecoration(
                        color: Color(0xFF000000),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Container(
                        width: 36,
                        height: 28,
                        padding: EdgeInsets.fromLTRB(9.7, 5.7, 9.4, 5.4),
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/shape_1_x2.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // 할인정보 텍스트
              margin: EdgeInsets.fromLTRB(12, 20, 12, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    '할인 정보',
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
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              width: double.infinity,
              height: 164,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x1A000000)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: new NetworkImage(
                      'https://drive.google.com/uc?export=view&id=15Q8YZqiLrGH_zACN2YvaDx8NSaMpgNKC'
                    )
                  ),
                ),
                child: Container(
                  width: 336,
                  height: 164,
                ),
              ),
            ),
            Container(
              // 진행중인 이벤트 품목 텍스트
              margin: EdgeInsets.fromLTRB(12, 28, 12, 0),
              child: Container(
                child: Text(
                  '진행 중인 이벤트 품목',
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
              // 진행중인 이벤트 품목 컨테이너
              height: 250,
              margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: new NetworkImage(
                                  context.watch<products>().recommendProductList[0].main_image,
                                )
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(6, 4, 0, 0),
                                  child: Text(
                                    context.watch<products>().recommendProductList[0].name,
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
                                  margin: EdgeInsets.fromLTRB(6, 4, 0, 4),
                                  child: Text(
                                    money.format(context.watch<products>().recommendProductList[0].price),
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
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: new NetworkImage(
                                  context.watch<products>().recommendProductList[1].main_image,
                                ),
                              ),
                            ),
                            child: Container(
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(6, 4, 0, 0),
                                  child: Text(
                                    context.watch<products>().recommendProductList[1].name,
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
                                  margin: EdgeInsets.fromLTRB(6, 4, 0, 4),
                                  child: Text(
                                    money.format(context.watch<products>().recommendProductList[1].price),
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
                  ),
                ],
              ),
            ),
            Container( // 전체 물품 카테고리 텍스트
              margin: EdgeInsets.fromLTRB(12, 20, 12, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    '전체 물품 카테고리',
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
            Container( // 전체 물품 카테고리 컨테이너
              margin: EdgeInsets.fromLTRB(12, 16, 12, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                        '💊',
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
                                    '건강기능식품',
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
                                        '😊',
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
                                    '단백질 보충제',
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
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                        '⭐',
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
                                    '프로틴 식품',
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
                                        '🍎',
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
                                    '비타민/미네랄',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          padding: EdgeInsets.fromLTRB(11, 11, 17.4, 11),
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
                                      '💪',
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
                                  '다이어트 보조제',
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
                                      '🛍️',
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
                                  '기타',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
