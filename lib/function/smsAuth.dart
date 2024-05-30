import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/function/getGymInfo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/user.dart';

smsAuth(BuildContext context, String phone) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('https://' + serverIP + '/flt/smsAuth'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phone': phone,
    }),
  );
  if (response.statusCode == 200) {
    return json.decode(utf8.decode(response.bodyBytes));
  } else {
    return json.decode(utf8.decode(response.bodyBytes))['message'];
  }
}