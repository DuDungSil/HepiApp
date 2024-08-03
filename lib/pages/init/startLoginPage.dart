import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../store/user.dart';
import '../../utils/constants.dart';

class StartLoginPage extends StatelessWidget {
  const StartLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: Constants.SCREEN_HORIZONTAL_MARGIN,
          child: Consumer<user>(
            builder: (context, user, child) {
              if (user.id != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go('/home');
                });
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '반갑습니다.\n우리는 헤파이입니다.',
                        textAlign: TextAlign.center,
                        style: Constants.getRobotoTxt(25, Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/onboard3.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  )),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo/logo_kakao.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('카카오 로그인', style: Constants.getPretendardTxt(15, Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo/logo_google.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('구글로 로그인', style: Constants.getPretendardTxt(15, Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo/logo_naver.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('네이버 로그인', style: Constants.getPretendardTxt(15, Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            '로그인없이 계속',
                            textAlign: TextAlign.center,
                            style: Constants.getRobotoTxt(17, Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/login');
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            '로그인',
                            textAlign: TextAlign.center,
                            style: Constants.getRobotoTxt(17, Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '아직 회원이 아니신가요?',
                            textAlign: TextAlign.center,
                            style: Constants.getRobotoTxt(13, Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('회원가입', textAlign: TextAlign.center, style: Constants.getRobotoTxt(13, Colors.blueAccent)),
                        ],
                      ),
                      const SizedBox(
                        height: Constants.BOTTOM_MARGIN_WITHOUT_BAR,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
