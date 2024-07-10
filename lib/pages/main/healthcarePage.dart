import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../store/user.dart';
import '../user/loginPage.dart';

class healthcarePage extends StatefulWidget {
  @override
  State<healthcarePage> createState() => _healthcarePageState();
}

class _healthcarePageState extends State<healthcarePage> {
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
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: EdgeInsets.only(top: 140),
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
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 155,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Text(
                    '건강 관리',
                    style: GoogleFonts.getFont(
                      'Roboto Condensed',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 0,
                      letterSpacing: -0.5,
                      color: Color(0xFF111111),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x1A000000),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Container(
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                          (loginUser.id != null)
                              ? Container(
                                  child: Text(
                                    loginUser.name,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginPage()),
                                    );
                                  },
                                  child: Container(
                                    child: Text(
                                      "로그인을 해주세요 >",
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      (loginUser.id != null)
                          ? Container(
                              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Text(
                                      '내 정보 설정',
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
                                    width: 5,
                                    height: 10,
                                    child: SizedBox(
                                      width: 5,
                                      height: 10,
                                      child: SvgPicture.asset(
                                        'assets/vectors/vector_9_x2.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}
