import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class goodsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            // 배경색
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'California Gold Nutrition, Sport,\n'
                        '분리유청단백질, 무맛, 454g(1lb)',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 1.3,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x1A000000)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                              'assets/images/image_3.png',
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // 판매 가격
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              '판매 가격: ₩40,101',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.3,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  // 수량 버튼
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Color(0xFF000000)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.remove)),
                                      Text(
                                        '1',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          height: 1.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add)),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // 위시리스트 버튼
                                  height: 45,
                                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Color(0xFF000000)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      '위시리스트 추가',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text(
                    '상품 설명',
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
                  // 상품 상세 설명
                  margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
                  child: Container(
                    child: Text(
                      'California Gold Nutrition SPORT 분리유청단백질, 1lb\n'
                          '단백질 27g, BCAA 6.1g, 글루탐산 4.6g\n'
                          '무맛\n'
                          '저유당\n'
                          '전자 재조합 소 성장호르몬 무함유\n'
                          '근육 성장 증진\n'
                          '증량제, 글루텐, 유전자 변형 성분, 대두 무함유\n'
                          '인공 색소, 인공 향료, 인공 감미료 무함유\n'
                          'cGMP 인증 시설에서 생산\n'
                          '100% 골드 개런티(Gold Guarantee)',
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
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Divider(
                    // 구분선
                    thickness: 0.3, // 두께
                    color: Colors.grey, // 색상
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Column(
                    //고객 구매후기
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '고객 구매후기',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'View more',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.3,
                            color: Color(0x80000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: Color(0x0D000000),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Color(0x1A000000),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'User 1',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 10,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_10_x2.svg',
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '최고의 상품 추천합니다.',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: Color(0x0D000000),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Color(0x1A000000),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'User 2',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 10,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_10_x2.svg',
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '맛있어서 자주 먹어요.',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: Color(0x0D000000),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Color(0x1A000000),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'User 3',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 10,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_10_x2.svg',
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '가격이 좋은거 같아용',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.3,
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
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Divider(
                    // 구분선
                    thickness: 0.3, // 두께
                    color: Colors.grey, // 색상
                  ),
                ),
                Container(
                  //추천상품
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '추천 상품',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'View more',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.3,
                            color: Color(0x80000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x1A000000)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                              'assets/images/image_1.png',
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '₩ 122,556',
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          margin: EdgeInsets.fromLTRB(10, 15, 5, 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF000000)),
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '구매하기',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.3,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 45,
                          margin: EdgeInsets.fromLTRB(5, 15, 10, 15),
                          decoration: BoxDecoration(
                            color: Color(0xFF000000),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '장바구니에 추가',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.3,
                                color: Color(0xFFFFFFFF),
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

        //상단바
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            //상단바
            height: 60,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //뒤로가기 버튼
                    margin: EdgeInsets.only(left: 15),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_left),
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    // 상품 정보 텍스트
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      '상품 정보',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 1.3,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
