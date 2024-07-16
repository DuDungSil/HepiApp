import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/function/setEncrypt.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../function/getProduct.dart';
import '../../store/products.dart';
import '../../store/user.dart';
import '../user/loginPage.dart';

class QRPage extends StatefulWidget {
  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  var loginUser = null;

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
    }
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 120),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Container(
              margin: Constants.SCREEN_HORIZONTAL_MARGIN,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // 'QR코드 스캔' 텍스트
                    margin: EdgeInsets.only(top: 20),
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
                          child: (loginUser.id != null)
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
                  (loginUser.id != null)
                      ? Consumer<products>(builder: (consumer, products, child) {
                          if (products.myProductList.isEmpty) {
                            return Container(
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
                            );
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
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: 'QR코드 스캔',
            child: Container(
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
                          context.push('/login');
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
                        //context.read<user>().logout();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(14, 5, 14, 5),
                        decoration: BoxDecoration(
                          border:
                          Border.all(color: const Color(0xFF9EA3B2)),
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
          ),
        ),
      ],
    );
  }
}
