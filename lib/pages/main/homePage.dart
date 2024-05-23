import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/getEventImage.dart';
import 'package:flutter_app/function/getProduct.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/widget/priceText.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/products.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getProduct(context, "event", "");
    getEventImage(context);
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
              margin: EdgeInsets.fromLTRB(15, 30, 0, 10),
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
            Container(
              // 검색 창 외곽선
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
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
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
            Consumer<eventImages>(builder: (consumer, eventImages, child) {
              if (eventImages.eventImageList.isEmpty) {
                return CircularProgressIndicator();
              } else {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                          image:
                              NetworkImage(eventImages.eventImageList[0].url)),
                    ),
                    child: Container(
                      width: 336,
                      height: 164,
                    ),
                  ),
                );
              }
            }),
            Container(
              // 진행중인 이벤트 품목 텍스트
              margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
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
            Consumer<products>(builder: (consumer, products, child) {
              if (products.eventProductList.isEmpty) {
                return CircularProgressIndicator();
              } else {
                return Container(
                  // 진행중인 이벤트 품목 컨테이너
                  height: 280,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                                      image: NetworkImage(
                                        products.eventProductList[0].main_image,
                                      )),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        products.eventProductList[0].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
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
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.topLeft,
                                        child: priceText(
                                            products.eventProductList[0].price,
                                            products.eventProductList[0].event,
                                            products
                                                .eventProductList[0].discount)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                                    image: NetworkImage(
                                      products.eventProductList[1].main_image,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        products.eventProductList[1].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
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
                                        margin: EdgeInsets.only(top: 10),
                                        child: priceText(
                                            products.eventProductList[1].price,
                                            products.eventProductList[1].event,
                                            products
                                                .eventProductList[1].discount)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
            Container(
              // 전체 물품 카테고리 텍스트
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
            Container(
              // 전체 물품 카테고리 컨테이너
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
