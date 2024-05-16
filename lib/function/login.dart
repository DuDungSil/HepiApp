import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/user.dart';

login (BuildContext context) async{
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('http://'+serverIP+'/flt/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': 'admin',
      'pwd': 'admin',
    }),
  );
  context.read<user>().setUser(jsonDecode(response.body));
}