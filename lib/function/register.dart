import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/function/setEncrypt.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

register(BuildContext context, regist tryRegist) async {
  // 입력 값 확인
  if (checkRegister(tryRegist) != "0") {
    return checkRegister(tryRegist);
  }

  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('https://' + serverIP + '/flt/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': tryRegist.nameText.text,
      'phone': tryRegist.phoneText.text,
      'id': tryRegist.idText.text,
      'pwd': tryRegist.pwdText.text,
    }),
  );

  // 회원가입 완료
  if (response.statusCode == 200) {
    return "0";
  } else {
    return json.decode(utf8.decode(response.bodyBytes))['message'];
  }
}

checkRegister(regist tryRegist) {

  if (tryRegist.hasNullField()) {
    return "모든 정보를 입력해주세요";
  }

  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(tryRegist.idText.text)) {
    return "올바르지 않은 이메일 주소입니다";
  }

  if (!checkPassword(tryRegist.pwdText.text)) {
    return "비밀번호를 확인해 주세요";
  }

  if (tryRegist.pwdText.text != tryRegist.rePwdText.text) {
    return "비밀번호가 서로 일치하지 않습니다";
  }

  return "0";
}


bool checkPassword(String password) {
  final regex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*[0-9]|.*[^A-Za-z0-9])(?=.{8,}).+$', // 최소 8자리 이상, 2종류 이상
  );

  return regex.hasMatch(password);
}