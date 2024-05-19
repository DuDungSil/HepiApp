import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/function/getProduct.dart';
import 'package:flutter_app/pages/products/productDetailPage.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../function/moneyFormat.dart';
import '../../store/products.dart';
import '../../store/user.dart';
import '../../widget/priceText.dart';
import '../products/cartPage.dart';
import '../user/loginPage.dart';

class myPage extends StatefulWidget {
  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  var isLogin = false;
  var loginUser;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // didChangeDependencies에서 context를 안전하게 사용
    loginUser = context.watch<user>();
    if (loginUser.id != null) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin == true) {
      getProduct(context, "mine", loginUser.id);
      getProduct(context, "cart", loginUser.id);
    }
    return Stack(children: [
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
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
                        (isLogin == true)
                            ? Container(
                                child: Text(
                                  loginUser.name,
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => loginPage()),
                                  );
                                },
                                child: Container(
                                  child: Text(
                                    "로그인을 해주세요 >",
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
                    (isLogin == true)
                        ? Container(
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
                                      'assets/vectors/vector_9_x2.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  '보유 품목 정보',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.3,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              (isLogin == true)
                  ? Consumer<products>(builder: (consumer, products, child) {
                      if (products.myProductList.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        return Container(
                          height: 280,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.myProductList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print(products.myProductList[index].name);
                                },
                                child: Container(
                                  width: 160,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x1A000000)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 160,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(
                                              products.myProductList[index]
                                                  .main_image,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: Text(
                                                products
                                                    .myProductList[index].name,
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
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: Text(
                                                products.myProductList[index]
                                                        .my_amount
                                                        .toString() +
                                                    '/' +
                                                    products
                                                        .myProductList[index]
                                                        .amount
                                                        .toString() +
                                                    products
                                                        .myProductList[index]
                                                        .unit +
                                                    ' ' +
                                                    '(${((products.myProductList[index].my_amount / products.myProductList[index].amount) * 100).toStringAsFixed(0)}%)',
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
                              );
                            },
                          ),
                        );
                      }
                    })
                  : Container(
                      height: 280,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0x1A000000)),
                      child: Text(
                        "",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  '장바구니',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.3,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              (isLogin == true)
                  ? Consumer<products>(builder: (consumer, products, child) {
                      if (products.cartProductList.isEmpty) {
                        return CircularProgressIndicator();
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cartPage()),
                            );
                          },
                          child: Container(
                            height: 280,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.cartProductList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 160,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0x1A000000)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 160,
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
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 0),
                                              child: Text(
                                                products.cartProductList[index]
                                                    .name,
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
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 10, 10, 0),
                                                child: priceText(
                                                    products
                                                        .cartProductList[index]
                                                        .price,
                                                    products
                                                        .cartProductList[index]
                                                        .event,
                                                    products
                                                        .cartProductList[index]
                                                        .discount)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    })
                  : Container(
                      height: 280,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0x1A000000)),
                      child: Text(
                        "",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          height: 1.3,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Text(
                                '💳',
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
                            '결제 내역',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.4,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1A000000),
                      ),
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Text(
                                '💖',
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
                            '찜한 상품',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.4,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1A000000),
                      ),
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Text(
                                '🔍',
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
                            '최근 본 상품',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.4,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1A000000),
                      ),
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0D000000),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Text(
                                '🛒',
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
                            '자주 산 제품',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.4,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1A000000),
                      ),
                      height: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  child: Text(
                    '선물함',
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
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  child: Text(
                    '내 주변 점포 찾기',
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
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Container(
                  child: Text(
                    '고객 센터',
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
            // 상품 정보 텍스트
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15),
            child: Text(
              '마이페이지',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 1.3,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
