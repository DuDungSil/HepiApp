import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/chattings.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/gym.dart';
import 'getChatting.dart';


sendChatting (BuildContext context, String user_id, String message) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('https://'+serverIP+'/flt/myChat'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': user_id,
      'message': message,
    }),
  );

  if (response.statusCode == 200) {
    getChatting(context, context.read<gym>().id);
    return "0";
  } else {
    return json.decode(utf8.decode(response.bodyBytes))['message'];
  }
}