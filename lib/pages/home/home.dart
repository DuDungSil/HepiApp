import 'package:flutter/material.dart';
import 'package:flutter_app/widget/priceText.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../function/getEventImage.dart';
import '../../function/getProduct.dart';
import '../../store/eventImages.dart';
import '../../store/products.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getProduct(context, "event", "");
    getEventImage(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 160),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              // 전체 레이아웃
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // 할인정보 텍스트
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        '진행 중인 이벤트',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 1.2,
                          letterSpacing: -0.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<eventImages>(builder: (consumer, eventImages, child) {
                  if (eventImages.eventImageList.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                        height: 164,
                        margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                        child: CircularProgressIndicator());
                  } else {
                    return Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
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
                              image: NetworkImage(
                                  eventImages.eventImageList[0].url)),
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
                  // 할인 중인 품목 텍스트
                  margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
                  child: Container(
                    child: Text(
                      '할인 중인 품목',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.2,
                        letterSpacing: -0.5,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Consumer<products>(builder: (consumer, products, child) {
                  if (products.eventProductList.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                        height: 280,
                        margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                        child: CircularProgressIndicator());
                  } else {
                    return Container(
                      height: 280,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // 카드의 개수를 설정합니다.
                        itemBuilder: (context, index) {
                          return SaleProductTile();
                        },
                        separatorBuilder: (context, index) => SizedBox(width: 10,),
                      ),
                    );
                  }
                }),
                Container(
                  // 카테고리 별 쇼핑 텍스트
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        '카테고리 별 쇼핑',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          height: 1.2,
                          letterSpacing: -0.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // 전체 물품 카테고리 컨테이너
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDDDDDD),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 134, 16, 12),
                                    child: Text(
                                      '건강기능식품',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        height: 1.9,
                                        letterSpacing: -0.5,
                                        color: Color(0xFF191919),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFDDDDDD),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(16, 134, 16, 12),
                                  child: Text(
                                    '단백질 보충제',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      height: 1.9,
                                      letterSpacing: -0.5,
                                      color: Color(0xFF191919),
                                    ),
                                  ),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDDDDDD),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 134, 16, 12),
                                    child: Text(
                                      '프로틴 식품',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        height: 1.9,
                                        letterSpacing: -0.5,
                                        color: Color(0xFF191919),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFDDDDDD),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(16, 134, 16, 12),
                                  child: Text(
                                    '비타민 / 미네랄',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      height: 1.9,
                                      letterSpacing: -0.5,
                                      color: Color(0xFF191919),
                                    ),
                                  ),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDDDDDD),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 134, 16, 12),
                                    child: Text(
                                      '다이어트 보조제',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        height: 1.9,
                                        letterSpacing: -0.5,
                                        color: Color(0xFF191919),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFDDDDDD),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(16, 134, 16, 12),
                                  child: Text(
                                    '간편한 식단',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      height: 1.9,
                                      letterSpacing: -0.5,
                                      color: Color(0xFF191919),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 160,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Text(
                    '헤파이 스토어',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 0,
                      letterSpacing: -0.5,
                      color: Color(0xFF111111),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // 배경색을 흰색으로 설정
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF9EA3B2), // 밑 선 색상을 회색으로 설정
                        width: 1,
                      ),
                    ),
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15, right: 15),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              'assets/vectors/search_normal_x2.svg',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '제품을 찾아보세요',
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              height: 1,
                              letterSpacing: -0.4,
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
        ),
      ],
    );
  }
}



Widget SaleProductTile() {
  return Container(
    width: 170,
    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Color(0xFFFFFFFF),
      boxShadow: [
        BoxShadow(
          color: Color(0x80000000),
          offset: Offset(8, 8),
          blurRadius: 10,
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  'assets/images/example.png',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Optimum Nutrition, 더블 리치 초콜릿 Whey,  2.27kg(5lb)',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  height: 1.2,
                  letterSpacing: -0.4,
                  color: Color(0xFF111111),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: Text(
                      '₩ 110,397',
                      style: GoogleFonts.getFont(
                        'Roboto Condensed',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        height: 1.2,
                        letterSpacing: -0.3,
                        color: Color(0xFFDC3644),
                      ),
                    ),
                  ),
                  Text(
                    '₩ 122,664',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0, // 선의 두께를 설정
                      height: 1.2,
                      letterSpacing: -0.3,
                      color: Color(0xFF767676),
                      decorationColor: Color(0xFF767676),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: SizedBox(
                      height : 20,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          // 평점 들어가야햠 ( 별 )
                          Container()
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '(673)',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.2,
                      letterSpacing: -0.3,
                      color: Color(0xFF9EA3B2),
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