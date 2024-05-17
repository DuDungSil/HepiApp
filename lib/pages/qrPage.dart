import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../function/getMyProduct.dart';
import '../store/products.dart';
import '../store/user.dart';
import 'loginPage.dart';

class qrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginUser = context.watch<user>();
    if (loginUser.id == null) {
      return loginPage();
    } else {
      getMyProduct(context, "mine", loginUser.id);
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loginUser.name,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                height: 1.5,
                                color: Color(0xFF000000),
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
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  'QR코드 스캔',
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
                height: 250,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x1A000000)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        'assets/images/image.jpeg',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(10),
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
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.all(10),
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
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(10),
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
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.all(10),
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
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
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
              Consumer<products>(builder: (consumer, products, child) {
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
                              border: Border.all(color: Color(0x1A000000)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                        products.myProductList[index].main_image,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: Text(
                                          products.myProductList[index].name,
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
                                        margin:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: Text(
                                          products.myProductList[index].my_amount
                                              .toString() +
                                              '/' +
                                              products.myProductList[index].amount
                                                  .toString() +
                                              products.myProductList[index].unit +
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
              }),
            ],
          ),
        ),
      );

    }
  }
}
