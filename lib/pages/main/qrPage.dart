import 'package:flutter/material.dart';
import 'package:flutter_app/function/setEncrypt.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../function/getMyProduct.dart';
import '../../store/products.dart';
import '../../store/qr.dart';
import '../../store/user.dart';
import '../user/loginPage.dart';

class qrPage extends StatefulWidget {
  @override
  State<qrPage> createState() => _qrPageState();
}

class _qrPageState extends State<qrPage> {
  var isLogin = false;
  var loginUser;

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
      getMyProduct(context, "mine", loginUser.id);
    }
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
                      (isLogin == true)
                          ? Column(
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
              // 'QR코드 스캔' 텍스트
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
            Consumer<user>(
              builder: (consumer, user, child) {
                return Container(
                    // QR코드 컨테이너
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x1A000000)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: (isLogin == true)
                        ? Container(
                            alignment: Alignment.center,
                            child: QrImageView(
                              data: user.getQr()!,
                              version: QrVersions.auto,
                              size: 250,
                            ),
                          )
                        : Container(alignment: Alignment.center, height: 250));
              },
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
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                            content: Container(
                                          height: 250,
                                          width: 250,
                                          child: QrImageView(
                                            data: setEncrypt('aa'),
                                            version: QrVersions.auto,
                                          ),
                                        )));
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
                                                  products.myProductList[index]
                                                      .amount
                                                      .toString() +
                                                  products.myProductList[index]
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
          ],
        ),
      ),
    );
  }
}
