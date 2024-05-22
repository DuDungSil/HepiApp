import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/gym.dart';


getGymInfo (BuildContext context, String user_id) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('https://'+serverIP+'/flt/gymInfo'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': user_id,
    }),
  );

  context.read<gym>().setGym(jsonDecode(response.body));
}