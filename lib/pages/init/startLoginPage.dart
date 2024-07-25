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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '반갑습니다.\n우리는 헤파이입니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: -0.55,
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/onboard3.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                'assets/images/logo/logo_kakao.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              '카카오 로그인',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                'assets/images/logo/logo_google.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              '구글로 로그인',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset(
                                'assets/images/logo/logo_naver.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              '네이버 로그인',
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: -0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Color(0xFF000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            '로그인 없이 계속',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.45,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          context.push('/login');
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            '로그인',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '아직 회원이 아니신가요?   ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9EA3B2),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          letterSpacing: 0.09,
                        ),
                      ),
                      Text(
                        '회원가입',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0075FF),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          height: 1.2,
                          letterSpacing: 0.09,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
