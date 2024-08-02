import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/user.dart';
import '../user/loginPage.dart';

class HealthcarePage extends StatefulWidget {
  @override
  State<HealthcarePage> createState() => _HealthcarePageState();
}

class _HealthcarePageState extends State<HealthcarePage> {
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
              // 전체 레이아웃
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 280,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F3F5),
                    shape: RoundedRectangleBorder(
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
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 1),
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFFF8A00), width: 1))),
                                    child: Text('이윤구', style: Constants.getPretendardTxt(18, Color(0xFFFF8A00))),
                                  ),
                                ),
                                TextSpan(
                                  text: '님, 오늘도 힘내세요!',
                                  style: Constants.getPretendardTxt(18, Colors.black)
                                ),
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 280,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F3F5),
                    shape: RoundedRectangleBorder(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 1),
                                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFFF8A00), width: 1))),
                                    child: Text('이윤구', style: Constants.getPretendardTxt(18, Color(0xFFFF8A00))),
                                  ),
                                ),
                                TextSpan(
                                    text: '님의 영양점수',
                                    style: Constants.getPretendardTxt(18, Colors.black)
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              context.go('/healthcare/nutritionScore');
                            },
                                child: Text('자세히 알아보기 >', style: Constants.getPretendardTxt(11, Colors.black45),),
                          )
                        ],
                      )
                    ],
                  ),
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
            title: '건강 관리',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/basic_user_profile.png',
                      width: 30, // 원하는 이미지 너비
                      height: 30, // 원하는 이미지 높이
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    (loginUser.id != null)
                        ? Text(
                            loginUser.name + ' 님',
                            style: Constants.getPretendardTxt(15, Colors.black),
                          )
                        : GestureDetector(
                            onTap: () {
                              context.push('/login');
                            },
                            child: Container(
                              child: Text(
                                "로그인을 해주세요 >",
                                style: Constants.getPretendardTxt(15, Colors.black),
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
