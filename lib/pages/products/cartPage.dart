import 'package:flutter/material.dart';
import 'package:flutter_app/pages/products/orderPage.dart';
import 'package:flutter_app/pages/products/productDetailPage.dart';
import 'package:flutter_app/widget/priceText.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/products.dart';

class cartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                // 배경색
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // 수령 방식 선택
                      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            '수령 방식 선택',
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
                      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              // QR 코드 발급 버튼
                              child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft),
                                child: Text(
                                  'QR 코드 발급',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: Color(0x80000000),
                                  ),
                                )),
                          )),
                          Expanded(
                            // 매장 픽업 버튼
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0x1A000000)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      alignment: Alignment.centerLeft),
                                  child: Text(
                                    '매장에서 한번에 픽업',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.4,
                                      color: Color(0x80000000),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //결제할 상품 텍스트
                      margin: EdgeInsets.fromLTRB(12, 28, 12, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                height: 1.3,
                                color: Color(0xFFC7C7C7),
                              ),
                              children: [
                                TextSpan(
                                  text: '결제할 상품',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    height: 1.3,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                TextSpan(
                                  text: '  총 3개',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    height: 1.3,
                                    color: Color(0xFFC7C7C7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Consumer<products>(builder: (consumer, products, child) {
                      if (products.cartProductList.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        return Container(
                          // 결제할 상품 컨테이너
                          margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
                          child: Column(
                            children: List.generate(
                                products.cartProductList.length, (index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => productDetailPage()),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0x1A000000)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 200,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(
                                              products.cartProductList[index]
                                                  .main_image,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        // 상품 이름, 가격
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // 상품이름 텍스트
                                            alignment: Alignment.centerLeft,
                                            margin:
                                                EdgeInsets.fromLTRB(10, 8, 0, 0),
                                            child: Text(
                                              products.cartProductList[index].name,
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
                                            // 가격
                                            alignment: Alignment.centerLeft,
                                            margin:
                                                EdgeInsets.fromLTRB(10, 4, 0, 8),
                                            child: priceText(
                                              products.cartProductList[index].price,
                                              products.cartProductList[index].event,
                                              products
                                                  .cartProductList[index].discount,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      }
                    }),
                    Container(
                      margin: EdgeInsets.fromLTRB(12, 20, 12, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '결제 금액',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  height: 1.3,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              '최종 결제 예정 금액: ₩89,854',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.3,
                                color: Color(0x80000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(12, 20, 12, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '🌟',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                height: 1.6,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Recommended Product',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Text(
                                '이 상품은 어때요?',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.3,
                                  color: Color(0x80000000),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // 구분선
                      margin: EdgeInsets.fromLTRB(10, 4, 10, 0),
                      child: Divider(
                        thickness: 0.3, // 두께
                        color: Colors.grey, // 색상
                      ),
                    ),
                    Container(
                      //추천상품 텍스트
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        '추천 상품',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    Consumer<products>(builder: (consumer, products, child) {
                      if (products.eventProductList.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        return Container(
                          margin: EdgeInsets.all(10),
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
                                height: 400,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                      products.eventProductList[0].main_image,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 0, 12, 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                      child: Text(
                                        products.eventProductList[0].name,
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
                                      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                      child: priceText(
                                          products.eventProductList[0].price,
                                          products.eventProductList[0].event,
                                          products
                                              .eventProductList[0].discount),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF000000)),
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => orderPage()),
                          );
                        },
                        child: Text(
                          '주문하기',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1.4,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 상단바
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_left),
                          color: Color(0xFF000000),
                        ),
                      ),
                      Container(
                        // 주문서 작성 텍스트
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          '장바구니',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            height: 1.2,
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
        ),
      ),
    );
  }
}
