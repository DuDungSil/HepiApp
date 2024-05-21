import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/register.dart';

class regist {
  bool hasNullField() {
    return nameText.text == "" ||
        phoneText.text == "" ||
        idText.text == "" ||
        pwdText.text == "" ||
        rePwdText.text == "";
  }

  var nameText = TextEditingController();
  var phoneText = TextEditingController();
  var idText = TextEditingController();
  var pwdText = TextEditingController();
  var rePwdText = TextEditingController();
}

class registerPage extends StatefulWidget {
  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  var allAgree = false;
  var adAgree = false;
  var authAgree = false;

  var hoverPwd = true;
  var hoverRePwd = true;

  var tryRegist = new regist();

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
              // 회원가입 전체 레이아웃
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    // 회원가입 텍스트
                    '회원가입',
                    style: GoogleFonts.getFont(
                      'Work Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      height: 1,
                      color: Color(0xFF323F4B),
                    ),
                  ),
                ),
                Container(
                  // 입력 필드 전체 컨테이너
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // 이름 입력 컨테이너
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                '이름',
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
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(Icons.person_2_outlined)),
                                  Expanded(
                                    child: TextFormField(
                                      controller: tryRegist.nameText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '이름을 입력해주세요',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.black,
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(20),
                                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // 연락처 입력 컨테이너
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                '연락처',
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
                              // 연락처 입력 컨테이너
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Icon(Icons.phone_iphone)),
                                        Expanded(
                                          child: TextFormField(
                                            controller: tryRegist.phoneText,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '01012345678',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Colors.black,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(11),
                                              FilteringTextInputFormatter.digitsOnly,
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      return print('인증하기 클릭');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF161616)),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFF161616),
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        child: Text(
                                          '인증하기',
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // 이메일 주소 입력 컨테이너
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                              // 이름 입력 컨테이너
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(Icons.mail_outline)),
                                  Expanded(
                                    child: TextFormField(
                                      controller: tryRegist.idText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'name@email.com',
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
                          ],
                        ),
                      ),
                      Container(
                        // 비밀번호 입력 컨테이너
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                              // 비밀번호 입력 컨테이너
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Icon(Icons.lock_outline)),
                                        Expanded(
                                          child: TextFormField(
                                            obscureText: hoverPwd,
                                            controller: tryRegist.pwdText,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '******',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Colors.black,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(20),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        hoverPwd = !hoverPwd;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child:
                                          Icon(Icons.visibility_off_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // 비밀번호 입력 컨테이너
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                '비밀번호 재확인',
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
                              // 비밀번호 입력 컨테이너
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFFFFF),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Icon(Icons.lock_outline)),
                                        Expanded(
                                          child: TextFormField(
                                            obscureText: hoverRePwd,
                                            controller: tryRegist.rePwdText,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '******',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: Colors.black,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(20),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        hoverRePwd = !hoverRePwd;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child:
                                          Icon(Icons.visibility_off_outlined),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          '영문, 숫자, 특수문자를 모두 조합하여 최소 8자리 이상',
                          style: GoogleFonts.getFont(
                            'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            height: 1.5,
                            color: Color(0xFF7B8794),
                          ),
                        ),
                      ),
                      Container(
                        // 약관 전체 컨테이너
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          // 약관 레이아웃
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '서비스 이용약관',
                              style: GoogleFonts.getFont(
                                'Mulish',
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                                height: 1,
                                letterSpacing: 1.5,
                                color: Color(0xFF323F4B),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                '서비스의 원활한 사용을 보장하기 위해서 헤파이의 서비스 이용약관에 대한 동의가 필요합니다.',
                                style: GoogleFonts.getFont(
                                  'Mulish',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  height: 1.5,
                                  color: Color(0xFF7B8794),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: 0,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          value: allAgree,
                                          onChanged: (value) {
                                            setState(() {
                                              allAgree = value!;
                                            });
                                          }),
                                      Text(
                                        '전체 동의 [약관 및 개인정보 수집 등]',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(40, 5, 10, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '[필수] 구매이용약관 동의',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                      Text(
                                        '[필수] 개인정보 수집 이용 동의',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                      Text(
                                        '[필수] 헤파이 회원 이용약관 동의',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                      Text(
                                        '[필수] 개인정보 제3자 제공 동의',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: 0,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          value: adAgree,
                                          onChanged: (value) {
                                            setState(() {
                                              adAgree = value!;
                                            });
                                          }),
                                      Text(
                                        '[선택] 광고성 정보 수신 동의',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: 0,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          value: authAgree,
                                          onChanged: (value) {
                                            setState(() {
                                              authAgree = value!;
                                            });
                                          }),
                                      Text(
                                        '[선택] 개인정보 유효기간 - 탈퇴시까지',
                                        style: GoogleFonts.getFont(
                                          'Mulish',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: Color(0xFF7B8794),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                var response =
                                    await register(context, tryRegist);
                                if (response == "0") {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      message: '회원가입에 성공했습니다',
                                    ),
                                    displayDuration:
                                        Duration(milliseconds: 500),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.error(
                                      message: response,
                                    ),
                                    displayDuration:
                                        Duration(milliseconds: 500),
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF161616)),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF161616),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                child: Text(
                                  '회원가입',
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
    );
  }
}
