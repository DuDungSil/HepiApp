import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/customAppbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../function/login.dart';
import '../../widgets/customBackButton.dart';

class LoginPage extends StatefulWidget {
  final String? redirect;

  LoginPage({this.redirect});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final idEdit = TextEditingController();
  final pwdEdit = TextEditingController();
  bool hoverPwd = true;
  bool isCheckedSaveLogin = false;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  Future<bool> myInterceptor (bool stopDefaultButtonEvent, RouteInfo info) async {
    if (!GoRouter.of(context).canPop())
      context.go('/home');
    return true;
  }

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
                      child: Text('이메일', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 10,
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
                              child: SvgPicture.asset(
                                'assets/vectors/envelope_simple_1_x2.svg',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: idEdit,
                                onTapOutside: (event) {
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('비밀번호', style: Constants.getPretendardTxt(13, Colors.grey)),
                    ),
                    const SizedBox(
                      height: 10,
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
                              child: SvgPicture.asset(
                                'assets/vectors/lock_5_x2.svg',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                obscureText: hoverPwd,
                                controller: pwdEdit,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '비밀번호를 입력해주세요.',
                                ),
                                style: Constants.getRobotoTxt(14, Colors.black54),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  hoverPwd = !hoverPwd;
                                });
                              },
                              child: Container(width: 20, height: 20, child: Icon(Icons.visibility_off_outlined)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
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
                                width: 25,
                                height: 25,
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
                                    side: BorderSide(color: Color(0xFF90A4AE))),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Text('자동 로그인', style: Constants.getPretendardTxt(13, Colors.grey)),
                              )
                            ],
                          )),
                          GestureDetector(
                            onTap: () {
                              context.push('/findAccount');
                            },
                            child: Container(
                              child: Text('아이디/비밀번호 찾기', textAlign: TextAlign.right, style: Constants.getPretendardTxt(13, Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo/logo_kakao.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('카카오 로그인', style: Constants.getPretendardTxt(15, Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo/logo_google.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('구글로 로그인', style: Constants.getPretendardTxt(15, Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFAFAFA),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFEEEEEE)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo/logo_naver.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('네이버 로그인', style: Constants.getPretendardTxt(15, Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var response = await login(context, idEdit.text, pwdEdit.text);
                        if (response == "0") {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.success(
                              message: '로그인에 성공했습니다',
                            ),
                            displayDuration: Duration(milliseconds: 500),
                          );
                          if (isCheckedSaveLogin == true) {
                            await secureStorage.write(key: 'loginID', value: idEdit.text);
                            await secureStorage.write(key: 'loginPWD', value: pwdEdit.text);
                          }
                          if (!GoRouter.of(context).canPop()) {
                            if (widget.redirect != null)
                              context.go(widget.redirect!);
                            else
                              context.go('/home');
                          } else
                            context.pop();
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
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF8A00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '로그인',
                          textAlign: TextAlign.center,
                          style: Constants.getRobotoTxt(17, Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '아직 회원이 아니신가요?',
                          textAlign: TextAlign.center,
                          style: Constants.getRobotoTxt(13, Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              context.push('/register');
                            },
                            child: Text('회원가입', textAlign: TextAlign.center, style: Constants.getRobotoTxt(13, Colors.blueAccent))),
                      ],
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
                title: '로그인',
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
