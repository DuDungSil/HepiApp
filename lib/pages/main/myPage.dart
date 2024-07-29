import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/function/getProduct.dart';
import 'package:flutter_app/pages/user/MyInfoSettingPage.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/products.dart';
import '../../store/user.dart';
import '../../widgets/priceText.dart';
import '../../widgets/productCard/normalProductCard.dart';
import '../products/cartPage.dart';
import '../user/loginPage.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
              Text('보유 품목 정보', style: Constants.getRobotoTxt(17, Colors.black)),
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
                height: 15,
              ),
              Text('장바구니', style: Constants.getRobotoTxt(17, Colors.black)),
              const SizedBox(
                height: 10,
              ),
              (loginUser.id != null)
                  ? Consumer<products>(builder: (consumer, products, child) {
                      if (products.cartProductList.isEmpty) {
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
                            itemCount: products.cartProductList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    context.push('/cart');
                                  },
                                  child: NormalProductCard(products.cartProductList[index]));
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
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                      '주문 목록',
                      style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Colors.black45),
                        right: BorderSide(width: 1, color: Colors.black45),
                        bottom: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                        '찜한 상품',
                        style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Colors.black45),
                        right: BorderSide(width: 1, color: Colors.black45),
                        bottom: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                        '구독 관리',
                        style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Colors.black45),
                        right: BorderSide(width: 1, color: Colors.black45),
                        bottom: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                        '자주 산 제품',
                        style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Colors.black45),
                        right: BorderSide(width: 1, color: Colors.black45),
                        bottom: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                        '선물 하기',
                        style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Colors.black45),
                        right: BorderSide(width: 1, color: Colors.black45),
                        bottom: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                        '내 주변 점포 찾기',
                        style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Colors.black45),
                        right: BorderSide(width: 1, color: Colors.black45),
                        bottom: BorderSide(width: 1, color: Colors.black45),
                      ),
                    ),
                    child: Text(
                        '고객센터',
                        style: Constants.getPretendardTxt(15, Colors.black)
                    ),
                  ),
                ],
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
          title: '마이페이지',
          trailing: [
            SvgPicture.asset(
              'assets/vectors/setting.svg',
              width: 25,
              height: 25,
            ),
          ],
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
    ]);
  }
}
