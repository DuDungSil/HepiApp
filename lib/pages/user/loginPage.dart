import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/login.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final idEdit = TextEditingController();
  final pwdEdit = TextEditingController();
  bool isCheckedSaveLogin = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                '이메일',
                                style: TextStyle(
                                  color: Color(0xFF9EA3B2),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 0.16,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              height: 60,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFAFAFA),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFF90A4AE)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                        'assets/vectors/envelope_simple_1_x2.svg',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: idEdit,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '이메일을 입력해주세요.',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Colors.black,
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(30),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 35, 0, 0),
                              child: Text(
                                '비밀번호',
                                style: TextStyle(
                                  color: Color(0xFF9EA3B2),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 0.16,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              height: 60,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFAFAFA),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFF90A4AE)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                        'assets/vectors/lock_5_x2.svg',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: pwdEdit,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '비밀번호를 입력해주세요.',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Colors.black,
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(30),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: 24,
                                        height: 24,
                                        child: Icon(
                                            Icons.visibility_off_outlined)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    child: Checkbox(
                                      value: isCheckedSaveLogin,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          isCheckedSaveLogin = newValue!;
                                        });
                                      },
                                        fillColor: WidgetStateProperty.resolveWith((states) {
                                          if (!states.contains(WidgetState.selected)) {
                                            return Color(0xFFFAFAFA);
                                          }
                                          return null;
                                        }),
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.5),
                                      ),
                                      side: BorderSide(
                                        color: Color(0xFF90A4AE)
                                      )
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '자동 로그인',
                                      style: TextStyle(
                                        color: Color(0xFF9EA3B2),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                              Container(
                                child: Text(
                                  '아이디/비밀번호 찾기',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF9EA3B2),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 0.16,
                                    letterSpacing: -0.35,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            var response =
                                await login(context, idEdit.text, pwdEdit.text);
                            if (response == "0") {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.success(
                                  message: '로그인에 성공했습니다',
                                ),
                                displayDuration: Duration(milliseconds: 500),
                              );
                              Navigator.pop(context);
                            } else {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message: response,
                                ),
                                displayDuration: Duration(milliseconds: 500),
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 50),
                            decoration: ShapeDecoration(
                              color: Color(0xFFFF8A00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              '로그인',
                              style: GoogleFonts.getFont(
                                'Work Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                height: 1,
                                letterSpacing: 1.3,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 50,
                        //   width: double.infinity,
                        //   alignment: Alignment.center,
                        //   margin: EdgeInsets.only(top: 10),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Color(0xFFFFEC00)),
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Color(0xFFFFEC00)),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         margin: EdgeInsets.only(right: 10),
                        //         decoration: BoxDecoration(
                        //           image: DecorationImage(
                        //             fit: BoxFit.cover,
                        //             image: AssetImage(
                        //               'assets/vectors/kakao_icon.png',
                        //             ),
                        //           ),
                        //         ),
                        //         width: 40,
                        //         height: 40,
                        //       ),
                        //       Text(
                        //         '카카오 로그인',
                        //         style: GoogleFonts.getFont(
                        //           'Work Sans',
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 15,
                        //           height: 1,
                        //           letterSpacing: 1.3,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 80,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/logo/logo_kakao.png',
                                    width: 30, // 원하는 이미지 너비
                                    height: 30, // 원하는 이미지 높이
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/logo/logo_google.png',
                                    width: 25, // 원하는 이미지 너비
                                    height: 25, // 원하는 이미지 높이
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF5F5F5),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/logo/logo_naver.png',
                                    width: 22, // 원하는 이미지 너비
                                    height: 22, // 원하는 이미지 높이
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                child: Text(
                                  '아직 회원이 아니신가요?',
                                  style: GoogleFonts.getFont(
                                    'Mulish',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Color(0xFF7B8794),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => registerPage()),
                                  );
                                },
                                child: Text(
                                  '회원가입',
                                  style: GoogleFonts.getFont(
                                    'Mulish',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    height: 1.6,
                                    color: Color(0xFF2F80ED),
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.4, // 밑줄 두께 조절
                                    decorationColor: Color(0xFF2F80ED), // 밑줄 색상 설정
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                height: 60,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    '로그인',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
