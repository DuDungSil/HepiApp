import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/smsAuth.dart';
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

  var phoneLock = false;

  var hoverPwd = true;
  var hoverRePwd = true;

  var auth = false;
  var authCode = "";
  var showAuthCode = false;
  var authCodeText = TextEditingController();

  late Timer timer;
  int timerTime = 180;

  void startTimer() {
    setState(() {
      timerTime = 180;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timerTime > 0) {
          timerTime--;
        } else {
          setState(() {
            showAuthCode = false;
            phoneLock = false;
          });
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: "인증시간이 만료되었습니다",
            ),
            displayDuration: Duration(milliseconds: 500),
          );
          timer.cancel();
        }
      });
    });
  }

  String get timeFormat {
    int minutes = timerTime ~/ 60;
    int seconds = timerTime % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  var tryRegist = new regist();

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
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
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
                            '이름',
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
                                  child: Icon(Icons.person_2_outlined),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: tryRegist.nameText,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '이름을 입력해주세요.',
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              '연락처',
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
                                    child: Icon(Icons.phone_iphone),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: tryRegist.phoneText,
                                      enabled: !phoneLock,
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
                                        LengthLimitingTextInputFormatter(
                                            11),
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ],
                                    ),
                                  ),
                                  showAuthCode
                                      ? Text(
                                    timeFormat,
                                    style: GoogleFonts.getFont(
                                      'Mulish',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      height: 1,
                                      letterSpacing: 1.3,
                                      color: Colors.black54,
                                    ),
                                  )
                                      : auth
                                      ? Text(
                                    "인증완료",
                                    style: GoogleFonts.getFont(
                                      'Mulish',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      height: 1,
                                      letterSpacing: 1.3,
                                      color: Colors.green,
                                    ),
                                  )
                                      : InkWell(
                                    onTap: () async {
                                      if (tryRegist.phoneText.text
                                          .length !=
                                          11 ||
                                          tryRegist.phoneText.text
                                              .substring(0, 3) !=
                                              "010") {
                                        showTopSnackBar(
                                          Overlay.of(context),
                                          CustomSnackBar.error(
                                            message:
                                            "올바른 핸드폰 번호를 입력해주세요",
                                          ),
                                          displayDuration: Duration(
                                              milliseconds: 500),
                                        );
                                      } else {
                                        var response = await smsAuth(
                                            context,
                                            tryRegist.phoneText.text);
                                        if (response.length == 6) {
                                          authCode = response;
                                          setState(() {
                                            authCodeText.text = "";
                                            showAuthCode = true;
                                            phoneLock = true;
                                          });
                                          startTimer();
                                        } else {
                                          showTopSnackBar(
                                            Overlay.of(context),
                                            CustomSnackBar.error(
                                              message: response,
                                            ),
                                            displayDuration: Duration(
                                                milliseconds: 500),
                                          );
                                        }
                                      }
                                    },
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF161616)),
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        color: Color(0xFF161616),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                          '인증하기',
                                          style: GoogleFonts.getFont(
                                            'Work Sans',
                                            fontWeight:
                                            FontWeight.w700,
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
                          ),
                        ],
                      ),
                    ),
                    if (showAuthCode)
                      Container(
                        // 인증번호 입력 컨테이너
                        margin: EdgeInsets.only(top: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF7B8794)),
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFFFFFFF),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Icon(Icons.lock_outline)),
                                  Expanded(
                                    child: TextFormField(
                                      controller: authCodeText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '000000',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.black,
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(6),
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (authCodeText.text == authCode) {
                                  setState(() {
                                    timer.cancel();
                                    showAuthCode = false;
                                    phoneLock = true;
                                    auth = true;
                                  });
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      message: '핸드폰 인증이 완료되었습니다',
                                    ),
                                    displayDuration:
                                        Duration(milliseconds: 500),
                                  );
                                } else {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    CustomSnackBar.error(
                                      message: '인증번호가 일치하지 않습니다',
                                    ),
                                    displayDuration:
                                        Duration(milliseconds: 500),
                                  );
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Color(0xFF161616)),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF161616),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    '확인',
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Column(
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
                                    child: Icon(Icons.mail_outline),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: tryRegist.idText,
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
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
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
                                    child: Icon(Icons.lock_outline),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      obscureText: hoverPwd,
                                      controller: tryRegist.pwdText,
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
                                        LengthLimitingTextInputFormatter(
                                            20),
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
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              '비밀번호 재확인',
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
                                    child: Icon(Icons.lock_outline),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      obscureText: hoverRePwd,
                                      controller: tryRegist.rePwdText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '비밀번호를 다시 입력해주세요.',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: Colors.black,
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(
                                            20),
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
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
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
                    // Container(
                    //   // 약관 전체 컨테이너
                    //   margin: EdgeInsets.only(top: 30),
                    //   child: Column(
                    //     // 약관 레이아웃
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         '서비스 이용약관',
                    //         style: GoogleFonts.getFont(
                    //           'Mulish',
                    //           fontWeight: FontWeight.w800,
                    //           fontSize: 12,
                    //           height: 1,
                    //           letterSpacing: 1.5,
                    //           color: Color(0xFF323F4B),
                    //         ),
                    //       ),
                    //       Container(
                    //         margin: EdgeInsets.only(top: 5),
                    //         child: Text(
                    //           '서비스의 원활한 사용을 보장하기 위해서 헤파이의 서비스 이용약관에 대한 동의가 필요합니다.',
                    //           style: GoogleFonts.getFont(
                    //             'Mulish',
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 12,
                    //             height: 1.5,
                    //             color: Color(0xFF7B8794),
                    //           ),
                    //         ),
                    //       ),
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             margin: EdgeInsets.only(top: 20),
                    //             child: Row(
                    //               children: [
                    //                 Checkbox(
                    //                     materialTapTargetSize:
                    //                         MaterialTapTargetSize.shrinkWrap,
                    //                     visualDensity: const VisualDensity(
                    //                       horizontal: 0,
                    //                       vertical:
                    //                           VisualDensity.minimumDensity,
                    //                     ),
                    //                     value: allAgree,
                    //                     onChanged: (value) {
                    //                       setState(() {
                    //                         allAgree = value!;
                    //                       });
                    //                     }),
                    //                 Text(
                    //                   '전체 동의 [약관 및 개인정보 수집 등]',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 16,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             margin: EdgeInsets.fromLTRB(40, 5, 10, 0),
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment:
                    //                   CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   '[필수] 구매이용약관 동의',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 12,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   '[필수] 개인정보 수집 이용 동의',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 12,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   '[필수] 헤파이 회원 이용약관 동의',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 12,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   '[필수] 개인정보 제3자 제공 동의',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 12,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             margin: EdgeInsets.only(top: 5),
                    //             child: Row(
                    //               children: [
                    //                 Checkbox(
                    //                     materialTapTargetSize:
                    //                         MaterialTapTargetSize.shrinkWrap,
                    //                     visualDensity: const VisualDensity(
                    //                       horizontal: 0,
                    //                       vertical:
                    //                           VisualDensity.minimumDensity,
                    //                     ),
                    //                     value: adAgree,
                    //                     onChanged: (value) {
                    //                       setState(() {
                    //                         adAgree = value!;
                    //                       });
                    //                     }),
                    //                 Text(
                    //                   '[선택] 광고성 정보 수신 동의',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 16,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             margin: EdgeInsets.only(top: 5),
                    //             child: Row(
                    //               children: [
                    //                 Checkbox(
                    //                     materialTapTargetSize:
                    //                         MaterialTapTargetSize.shrinkWrap,
                    //                     visualDensity: const VisualDensity(
                    //                       horizontal: 0,
                    //                       vertical:
                    //                           VisualDensity.minimumDensity,
                    //                     ),
                    //                     value: authAgree,
                    //                     onChanged: (value) {
                    //                       setState(() {
                    //                         authAgree = value!;
                    //                       });
                    //                     }),
                    //                 Text(
                    //                   '[선택] 개인정보 유효기간 - 탈퇴시까지',
                    //                   style: GoogleFonts.getFont(
                    //                     'Mulish',
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 16,
                    //                     height: 1.5,
                    //                     color: Color(0xFF7B8794),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    InkWell(
                      onTap: () async {
                        if (auth == false) {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message: "핸드폰 인증을 완료해주세요",
                            ),
                            displayDuration:
                            Duration(milliseconds: 500),
                          );
                        } else {
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
                        }
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 40),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF8A00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Text(
                          '회원가입',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                            letterSpacing: -0.45,
                          ),
                        ),
                      ),
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
                    '회원가입',
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
