import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/chattings.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


getChatting (BuildContext context, String gym_id) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('https://'+serverIP+'/flt/chatting'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'gym_id': gym_id,
    }),
  );

  var _chatList = [];
  for (var _chatting in jsonDecode(response.body)) {
    _chatList.add(new chatting(_chatting['time'], _chatting['gym_id'], _chatting['user_id'], _chatting['user_name'], _chatting['message']));
  }
  context.read<chattings>().setChatList(_chatList);
}