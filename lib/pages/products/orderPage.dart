import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/products/productDetailPage.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/products.dart';
import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';
import '../../widgets/priceText.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int buyTypeButton = 1;
  int cashTypeButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '수령 방식 선택',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              buyTypeButton = 1;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: buyTypeButton == 1 ? Color(0x26FF8A00) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: buyTypeButton == 1 ? Color(0xFFFF8A00) : Color(0xFF9EA3B2)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Text(
                              '택배 배송',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              buyTypeButton = 2;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: buyTypeButton == 2 ? Color(0x26FF8A00) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: buyTypeButton == 2 ? Color(0xFFFF8A00) : Color(0xFF9EA3B2)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Text(
                              '정기 배송',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              buyTypeButton = 3;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: buyTypeButton == 3 ? Color(0x26FF8A00) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: buyTypeButton == 3 ? Color(0xFFFF8A00) : Color(0xFF9EA3B2)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Text(
                              '오프라인 QR 발급',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    buyTypeButton != 3
                        ? Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: Text(
                              '배송지 정보',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.45,
                              ),
                            ),
                          )
                        : Container(),
                    buyTypeButton != 3
                        ? Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '이윤구',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                    Text(
                                      '010-5882-9967',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                    Text(
                                      '전북특별자치도 전주시 완산구 당산로 34',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                      ),
                                      child: Text(
                                        '배송 시 요청사항을 선택해주세요.',
                                        style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 1.2,
                                          letterSpacing: -0.35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 25,
                                  width: 100,
                                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: Text(
                                    '배송지 변경',
                                    style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                      letterSpacing: -0.35,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Text(
                        '구매 상품 정보',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    Consumer<products>(builder: (consumer, products, child) {
                      if (products.cartProductList.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        return Column(
                          children: List.generate(products.cartProductList.length, (index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0x7F9EA3B2)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      //상품 사진
                                      width: 75,
                                      height: 75,
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      alignment: Alignment.center,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(products.cartProductList[index].main_image),
                                          fit: BoxFit.contain,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        // 상품 이름, 가격
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products.cartProductList[index].name,
                                            style: TextStyle(
                                              color: Color(0xFF111111),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Text(
                                            '수량 1개',
                                            style: TextStyle(
                                              color: Color(0xFF777C89),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Column(
                                        // 상품 이름, 가격
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '₩ 122,664원',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFF767676),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.lineThrough,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Text(
                                            '₩ 110,397원',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFF111111),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Text(
                                            '5,519원 적립',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFFFF8A00),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                          Text(
                                            '₩ 110,397원',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xFF111111),
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w600,
                                              height: 1.2,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      }
                    }),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Text(
                        '할인 혜택',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '상품 할인',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Text(
                                '-12,267원',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFDC3644),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '등급 할인',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Text(
                                '-1,755원',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFDC3644),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '상품 쿠폰 할인',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Text(
                                '-0원',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '보유 적립금 사용',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 3, 10, 3),
                                    alignment: Alignment.centerRight,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
                                      ),
                                    ),
                                    child: Text(
                                      '5,000원',
                                      style: TextStyle(
                                        color: Color(0xFF767676),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1, color: Color(0xFF111111)),
                                      ),
                                    ),
                                    child: Text(
                                      '사용',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '보유 적립금: 5,000원',
                                style: TextStyle(
                                  color: Color(0xFF767676),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Text(
                                '사용 가능 적립금: 5,000원',
                                style: TextStyle(
                                  color: Color(0xFF767676),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Text(
                                '적립금 사용: -5,000원',
                                style: TextStyle(
                                  color: Color(0xFFDC3644),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '할인 합계',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                              Text(
                                '-19,022원',
                                style: TextStyle(
                                  color: Color(0xFFDC3644),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Text(
                        '결제 수단',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cashTypeButton = 1;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: cashTypeButton == 1 ? Color(0x26FF8A00) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: cashTypeButton == 1 ? Color(0xFFFF8A00) : Color(0xFF9EA3B2)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Text(
                              '네이버페이',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cashTypeButton = 2;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: cashTypeButton == 2 ? Color(0x26FF8A00) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: cashTypeButton == 2 ? Color(0xFFFF8A00) : Color(0xFF9EA3B2)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Text(
                              '토스페이',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cashTypeButton = 3;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: cashTypeButton == 3 ? Color(0x26FF8A00) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: cashTypeButton == 3 ? Color(0xFFFF8A00) : Color(0xFF9EA3B2)),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0A000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Text(
                              '휴대폰',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Text(
                        '최종 결제 금액',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xFF9EA3B2)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '상품 금액',
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Text(
                            '220,794원',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xFF9EA3B2)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '배송비',
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Text(
                            '0원',
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xFF9EA3B2)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '할인 금액',
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Text(
                            '-19,022원',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFDC3644),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xFF9EA3B2)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '최종 결제 금액',
                            style: TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Text(
                            '201,772원',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      alignment: Alignment.center,
                      child: Text(
                        '주문 내용을 확인했으며 서비스 약관 및 결제에 동의합니다.',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF8A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        '201,772원 결제하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          letterSpacing: -0.35,
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
                child: CustomAppbar(
                  title: '주문서 작성',
                  leading: CustomBackButton(
                    onTap: () {
                      context.pop();
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
