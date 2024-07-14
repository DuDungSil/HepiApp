import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/function/getProduct.dart';
import 'package:flutter_app/pages/user/myInfoSetting.dart';
import 'package:flutter_app/utils/constants.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/products.dart';
import '../../store/user.dart';
import '../../widgets/priceText.dart';
import '../products/cartPage.dart';
import '../user/loginPage.dart';

class myPage extends StatefulWidget {
  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  var loginUser = null;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // didChangeDependencies에서 context를 안전하게 사용
    loginUser = context.watch<user>();
  }

  @override
  Widget build(BuildContext context) {
    if (loginUser.id != null) {
      getProduct(context, "mine", loginUser.id);
      getProduct(context, "cart", loginUser.id);
    }
    return Stack(children: [
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          margin: Constants.SCREEN_HORIZONTAL_MARGIN,
          padding: EdgeInsets.only(top: 160),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '보유 품목 정보',
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
              (loginUser.id != null)
                  ? Consumer<products>(builder: (consumer, products, child) {
                      if (products.myProductList.isEmpty) {
                        return Container(
                          height: 280,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0x1A000000)),
                        );
                      } else {
                        return Container(
                          height: 280,
                          margin: EdgeInsets.only(top: 10),
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
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0x1A000000)),
                    ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '장바구니',
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
              (loginUser.id != null)
                  ? Consumer<products>(builder: (consumer, products, child) {
                      if (products.cartProductList.isEmpty) {
                        return Container(
                          height: 280,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 10),
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
                        );
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
                            margin: EdgeInsets.only(top: 10),
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
                                                      .discount),
                                            ),
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
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0x1A000000)),
                    ),
              // 코드 추가 필요
              Container(
                height: 80,
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: Constants.SCREEN_HORIZONTAL_MARGIN,
          decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          alignment: Alignment.center,
          height: 160,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: Constants.APPBAR_TITLE_HEIGHT,
                ),
                child: Text(
                  '마이 페이지',
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
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF), // 배경색을 흰색으로 설정
                ),
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
                          child: Image.asset(
                            'assets/images/basic_user_profile.png',
                            width: 40, // 원하는 이미지 너비
                            height: 40, // 원하는 이미지 높이
                            fit: BoxFit.contain,
                          ),
                        ),
                        (loginUser.id != null)
                            ? Container(
                                child: Text(
                                  loginUser.name + ' 님',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    letterSpacing: -0.30,
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
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    (loginUser.id != null)
                        ? Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myInfoSetting()),
                                );
                                //context.read<user>().logout();
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFF9EA3B2)),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  '내 정보 설정',
                                  style: GoogleFonts.robotoCondensed(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    height: 1.2,
                                    letterSpacing: -0.4,
                                    color: const Color(0xFF191919),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
