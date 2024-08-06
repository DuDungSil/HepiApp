import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/smsAuth.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/register.dart';
import '../../widgets/customBackButton.dart';

class Regist {
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

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  var tryRegist = new Regist();

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
                padding: EdgeInsets.only(top: Constants.APPBAR_TITLE_HEIGHT),
                margin: Constants.SCREEN_HORIZONTAL_MARGIN,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('이름', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF90A4AE)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              child: Icon(Icons.person_2_outlined),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: tryRegist.nameText,
                                onTapOutside: (event){
                                  FocusScope.of(context).unfocus();
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '이름을 입력해주세요.',
                                ),
                                style: Constants.getRobotoTxt(14, Colors.black54),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('핸드폰 번호', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF90A4AE)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            child: Icon(Icons.phone_iphone),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: tryRegist.phoneText,
                              enabled: !phoneLock,
                              onTapOutside: (event){
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '01012345678',
                              ),
                              style: Constants.getRobotoTxt(14, Colors.black54),
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
                            style: Constants.getRobotoTxt(14, Colors.black54),
                          )
                              : auth
                              ? Text(
                            "인증완료",
                            style: Constants.getRobotoTxt(14, Colors.black54),
                          )
                              : GestureDetector(
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFF161616)),
                                borderRadius:
                                BorderRadius.circular(5),
                                color: Color(0xFF161616),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(8),
                                child: Text(
                                  '인증하기',
                                  style: Constants.getRobotoTxt(13, Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                    if (showAuthCode)
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            // 인증번호 입력 컨테이너
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Color(0xFF7B8794)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        child: Icon(Icons.lock_outline),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: authCodeText,
                                          onTapOutside: (event){
                                            FocusScope.of(context).unfocus();
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '000000',
                                          ),
                                          style: Constants.getRobotoTxt(14, Colors.black54),
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
                                GestureDetector(
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
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFF161616)),
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      color: Color(0xFF161616),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Text(
                                        '확인',
                                        style: Constants.getRobotoTxt(13, Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('이메일', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF90A4AE)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            child: Icon(Icons.mail_outline),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: tryRegist.idText,
                              onTapOutside: (event){
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '이메일을 입력해주세요.',
                              ),
                              style: Constants.getRobotoTxt(14, Colors.black54),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('비밀번호', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF90A4AE)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            child: Icon(Icons.lock_outline),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              obscureText: hoverPwd,
                              controller: tryRegist.pwdText,
                              onTapOutside: (event){
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '비밀번호를 입력해주세요.',
                              ),
                              style: Constants.getRobotoTxt(14, Colors.black54),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    20),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hoverPwd = !hoverPwd;
                              });
                            },
                            child: Icon(Icons.visibility_off_outlined),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('비밀번호 재확인', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF90A4AE)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            child: Icon(Icons.lock_outline),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              obscureText: hoverRePwd,
                              controller: tryRegist.rePwdText,
                              onTapOutside: (event){
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '비밀번호를 다시 입력해주세요.',
                              ),
                              style: Constants.getRobotoTxt(14, Colors.black54),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    20),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hoverRePwd = !hoverRePwd;
                              });
                            },
                            child: Icon(Icons.visibility_off_outlined),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '영문, 숫자, 특수문자를 모두 조합하여 최소 8자리 이상',
                          style: Constants.getPretendardTxt(12, Colors.blueGrey)
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
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
                        height: 50,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF8A00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '회원가입',
                          textAlign: TextAlign.center,
                          style: Constants.getRobotoTxt(17, Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Constants.BOTTOM_MARGIN_WITHOUT_BAR,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppbar(
                title: '회원가입',
                leading: CustomBackButton(
                  onTap: (){
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
