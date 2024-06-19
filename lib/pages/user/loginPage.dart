import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
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

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFC4C4C4),
                        ),
                        width: double.infinity,
                        height: 200,
                        child: SvgPicture.asset(
                          'assets/vectors/imagedefault_24_x2.svg',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                              child: Text(
                                '이메일 주소',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
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
                                    child: TextField(
                                      controller: idEdit,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'example@email.com',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                '비밀번호',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  height: 1,
                                  letterSpacing: 1.5,
                                  color: Color(0xFF323F4B),
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
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
                                    child: TextField(
                                      obscureText: true,
                                      controller: pwdEdit,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '********',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              alignment: Alignment.centerRight,
                              child: Text(
                                '계정찾기',
                                style: GoogleFonts.getFont(
                                  'Work Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  height: 1,
                                  letterSpacing: 1.3,
                                  color: Color(0xFF000000),
                                  decorationColor: Color(0xFF000000),
                                ),
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
                                height: 50,
                                width: double.infinity,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF161616)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF161616),
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

                            Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFFFEC00)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFFFEC00)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/vectors/kakao_icon.png',
                                        ),
                                      ),
                                    ),
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    '카카오 로그인',
                                    style: GoogleFonts.getFont(
                                      'Work Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      height: 1,
                                      letterSpacing: 1.3,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                    child: Text(
                                      '계정이 아직 없으신가요?',
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
                                        height: 1.5,
                                        color: Color(0xFF2F80ED),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey, // 테두리 색상
                      width: 0.3, // 테두리 두께
                    ),
                  ),
                ),
                child: Text(
                  '로그인',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.3,
                    color: Color(0xFF000000),
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
