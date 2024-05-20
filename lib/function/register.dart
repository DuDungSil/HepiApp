import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/user.dart';

register(BuildContext context, regist tryRegist) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('http://' + serverIP + '/flt/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': tryRegist.nameText.text,
      'phone': tryRegist.phoneText.text,
      'id': tryRegist.idText.text,
      'pwd': tryRegist.pwdText.text,
      'rePwd': tryRegist.rePwdText.text,
    }),
  );
  if (response.statusCode == 200) {
    return "0";
  } else {
    return json.decode(utf8.decode(response.bodyBytes))['message'];
  }
}
