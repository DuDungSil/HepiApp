import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/login.dart';

class loginPage extends StatelessWidget {
  final idEdit = TextEditingController();
  final pwdEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                  ),
                  width: double.infinity,
                  height: 250,
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
                        child: Text(
                          '로그인',
                          style: GoogleFonts.getFont(
                            'Work Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            height: 1,
                            color: Color(0xFF323F4B),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
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
                                  color: Color(0xFF7B8794),
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
                                  color: Color(0xFF7B8794),
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
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF161616)),
                            borderRadius: BorderRadius.circular(50),
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        color: Color(0xFF000000),
                      ),
                      width: double.infinity,
                      height: 1,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      margin: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Text(
                        '간편로그인',
                        style: GoogleFonts.getFont(
                          'Mulish',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xFF7B8794),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/vectors/ably_com_1_x2.svg',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/wavve_com.png',
                            ),
                          ),
                        ),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/vectors/icon_google_1_x2.svg',
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_1066_x2.svg',
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
    );
  }
}
