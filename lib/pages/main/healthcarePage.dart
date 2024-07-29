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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: Color(0x1A000000)), borderRadius: BorderRadius.circular(6), color: Color(0x1A000000)),
                )
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
    ;
  }
}
