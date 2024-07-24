import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/smsAuth.dart';
import '../../utils/constants.dart';
import '../../widgets/customAppbar.dart';
import '../../widgets/customBackButton.dart';

class findIdPage extends StatefulWidget {
  @override
  State<findIdPage> createState() => _findIdPageState();
}

class _findIdPageState extends State<findIdPage> {
  var nameText = TextEditingController();
  var phoneText = TextEditingController();
  var authCodeText = TextEditingController();

  var phoneLock = false;
  var auth = false;
  var authCode = "";
  var showAuthCode = false;

  int timerTime = 180;
  String get timeFormat {
    int minutes = timerTime ~/ 60;
    int seconds = timerTime % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  late Timer timer;
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

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 100),
                      margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                      child: Column(
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
                                      controller: nameText,
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
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 25, 0, 0),
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
                                      controller: phoneText,
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
                                      if (phoneText.text
                                          .length !=
                                          11 ||
                                          phoneText.text
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
                                            phoneText.text);
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
                        ],
                      ),
                    ),
                  ),
                ),
                showAuthCode ?
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF8A00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      '확인',
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
                ) :
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    '확인',
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
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppbar(
                title: '아이디 찾기',
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
