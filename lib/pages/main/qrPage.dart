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
import '../../widgets/productCard/normalProductCard.dart';
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
            padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT + Constants.APPBAR_CONTENT_HEIGHT),
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text('QR코드 스캔', style: Constants.getRobotoTxt(17, Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Consumer<user>(
                  builder: (consumer, user, child) {
                    return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: (loginUser.id != null)
                            ? Container(
                                alignment: Alignment.center,
                                child: QrImageView(
                                  data: user.getQr()!,
                                  version: QrVersions.auto,
                                  size: 200,
                                ),
                              )
                            : Container(alignment: Alignment.center, height: 200));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('보유 포인트', style: Constants.getRobotoTxt(17, Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '사용 가능한 쿠폰',
                          style: Constants.getPretendardTxt(13, Colors.black54),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '포인트 적립',
                          style: Constants.getPretendardTxt(13, Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '내 리워드',
                          style: Constants.getPretendardTxt(13, Colors.black54),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x1A000000)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '할인 정보',
                          style: Constants.getPretendardTxt(13, Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('보유 품목 목록', style: Constants.getRobotoTxt(17, Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                (loginUser.id != null)
                    ? Consumer<products>(builder: (consumer, products, child) {
                  if (products.myProductList.isEmpty) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all(color: Color(0x1A000000)), borderRadius: BorderRadius.circular(6), color: Color(0x1A000000)),
                    );
                  } else {
                    return Container(
                      height: 200,
                      clipBehavior: Clip.none,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.myProductList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                print(products.myProductList[index].name);
                              },
                              child: NormalProductCard(products.myProductList[index]));
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                      ),
                    );
                  }
                })
                    : Container(
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: Color(0x1A000000)), borderRadius: BorderRadius.circular(6), color: Color(0x1A000000)),
                ),
                const SizedBox(
                  height: Constants.BOTTOM_MARGIN_WITH_BAR,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppbar(
            title: 'QR코드 스캔',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/basic_user_profile.png',
                      width: 30, // 원하는 이미지 너비
                      height: 30, // 원하는 이미지 높이
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 10,),
                    (loginUser.id != null)
                        ? Text(loginUser.name + ' 님', style: Constants.getPretendardTxt(15, Colors.black))
                        : GestureDetector(
                      onTap: () {
                        context.push('/login');
                      },
                      child: Container(
                        child: Text("로그인을 해주세요 >", style: Constants.getPretendardTxt(15, Colors.black)),
                      ),
                    ),
                  ],
                ),
                (loginUser.id != null)
                    ? GestureDetector(
                      onTap: () {
                        context.push('/myInfoSetting');
                      },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF9EA3B2)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text('내 정보 설정', style: Constants.getPretendardTxt(12, Colors.black)),
                  ),
                    )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
