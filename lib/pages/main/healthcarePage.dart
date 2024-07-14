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
            margin: Constants.SCREEN_HORIZONTAL_MARGIN,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: EdgeInsets.only(top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container()
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
    ;
  }
}
