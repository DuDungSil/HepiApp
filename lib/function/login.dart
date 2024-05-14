import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/user.dart';

login (BuildContext context) async{
  var response = await http.post(
    Uri.parse('http://10.0.2.2:3573/flt/login'),
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