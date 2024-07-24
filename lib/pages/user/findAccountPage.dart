import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';

class findAccountPage extends StatefulWidget {
  @override
  State<findAccountPage> createState() => _findAccountPageState();
}

class _findAccountPageState extends State<findAccountPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              margin: Constants.SCREEN_HORIZONTAL_MARGIN,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            '계정을 잊으셨나요?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.55,
                            ),
                          ),
                        ),
                        Text(
                          '아래에서 원하시는 항목을 선택해주세요.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            letterSpacing: -0.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push('/findId');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF8A00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            '아이디 찾기',
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
                      Container(
                        width: double.infinity,
                        height: 60,
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF8A00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          '비밀번호 찾기',
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
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppbar(
                title: '아이디/비밀번호 찾기',
                leading: CustomBackButton(
                  onTap: () {
                    if (!GoRouter.of(context).canPop())
                      context.go('/home');
                    else
                      context.pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
