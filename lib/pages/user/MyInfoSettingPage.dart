import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/store/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';

import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';

class MyInfoSetting extends StatefulWidget {
  @override
  State<MyInfoSetting> createState() => _MyInfoSettingState();
}

class _MyInfoSettingState extends State<MyInfoSetting> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Container(
                  margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 125,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 0, 20, 0),
                              child: Image.asset(
                                'assets/images/basic_user_profile.png',
                                width: 60, // 원하는 이미지 너비
                                height: 60, // 원하는 이미지 높이
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Text(
                                context.read<user>().name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '회원 정보',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 18,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.45,
                            ),
                          ),
                          Text(
                            '회원정보 수정',
                            style: TextStyle(
                              color: Color(0xFF0075FF),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // 전체 회원 정보 컨테이너
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            UnderlineText('고객명', '이윤구'),
                            UnderlineText('닉네임', '헬창아님'),
                            UnderlineText('이메일', 'madorlight@naver.com'),
                            UnderlineText('연락처', '010-5882-9967'),
                            UnderlineText('주소지', '[54947] 전북특별자치도 전주시 완산구 서신동 당산로 34'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 70,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                secureStorage.write(key: 'loginID', value: null);
                                secureStorage.write(key: 'loginPWD', value: null);
                                context.read<user>().logout();
                                context.pop();
                              },
                              child: Text(
                                '로그아웃',
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.2,
                                  letterSpacing: -0.45,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 300,)
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
                  title: '내 정보 설정',
                  leading: CustomBackButton(
                    onTap: () {
                      context.pop();
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Widget UnderlineText(String title, String content) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: Color(0xFF9EA3B2)),
      ),
    ),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF777C89),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.40,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Text(
            content,
            textAlign: TextAlign.left,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF191919),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.2,
              letterSpacing: -0.40,
            ),
          ),
        ),
      ],
    ),
  );
}
