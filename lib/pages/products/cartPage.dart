import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/priceText.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../function/moneyFormat.dart';
import '../../store/products.dart';
import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> checkedProducts = [];
  List<int> productCount = []; // 구매할 특정 제품의 개수
  List<product> selectedProductList = []; // 선택된 제품들을 저장할 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                    padding: EdgeInsets.only(top: 60),
                    child: Consumer<products>(builder: (consumer, products, child) {
                      if (products.cartProductList.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        if (checkedProducts.length != products.cartProductList.length) {
                          checkedProducts = List<bool>.filled(products.cartProductList.length, false);
                          productCount = List<int>.filled(products.cartProductList.length, 1);
                        }
                        return Column(
                          children: List.generate(products.cartProductList.length, (index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  context.push('/productDetail');
                                },
                                child: Container(
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Checkbox(
                                              value: checkedProducts[index],
                                              onChanged: (bool? newValue) {
                                                setState(() {
                                                  checkedProducts[index] = newValue!;
                                                  if (newValue) {
                                                    selectedProductList.add(products.cartProductList[index]);
                                                  } else {
                                                    selectedProductList.remove(products.cartProductList[index]);
                                                  }
                                                });
                                              },
                                              fillColor: MaterialStateProperty.resolveWith((states) {
                                                if (!states.contains(MaterialState.selected)) {
                                                  return Color(0xFFFAFAFA);
                                                }
                                                return null;
                                              }),
                                              activeColor: Colors.blue,
                                              checkColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6.5),
                                              ),
                                              side: BorderSide(color: Color(0xFF90A4AE)),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 10),
                                            child: SvgPicture.asset(
                                              'assets/vectors/close.svg',
                                              width: 10,
                                              height: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(15,5,15,15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fitHeight,
                                                      image: NetworkImage(
                                                        products.cartProductList[index].main_image,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '마이 프로틴',
                                                        style: TextStyle(
                                                          color: Color(0xFF767676),
                                                          fontSize: 12,
                                                          fontFamily: 'Pretendard',
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.2,
                                                          letterSpacing: -0.30,
                                                        ),
                                                      ),
                                                      Text(
                                                        products.cartProductList[index].name,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: Color(0xFF111111),
                                                          fontSize: 12,
                                                          fontFamily: 'Pretendard',
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.2,
                                                          letterSpacing: -0.30,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.remove,
                                                              size: 20,
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                if (productCount[index] > 1) {
                                                                  productCount[index]--;
                                                                }
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            productCount[index].toString(),
                                                            style: TextStyle(
                                                              color: Color(0xFF111111),
                                                              fontSize: 14,
                                                              fontFamily: 'Pretendard',
                                                              fontWeight: FontWeight.w600,
                                                              height: 1.2,
                                                              letterSpacing: -0.35,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 20,
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                productCount[index]++;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '상품 가격',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2,
                                                    letterSpacing: -0.30,
                                                  ),
                                                ),
                                                Text(
                                                  money.format(products.cartProductList[index].price),
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
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '할인 가격',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2,
                                                    letterSpacing: -0.30,
                                                  ),
                                                ),
                                                Text(
                                                  money.format(products.cartProductList[index].price),
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
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '적립금',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Colors.black,
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
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '쿠폰 사용',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2,
                                                    letterSpacing: -0.30,
                                                  ),
                                                ),
                                                Text(
                                                  "",
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }
                    }),
                  ),
                  Container(
                    margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                    child: InkWell(
                      onTap: () {
                        context.push('/order');
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF8A00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '주문서 작성',
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
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomAppbar(
                  title: '장바구니',
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
