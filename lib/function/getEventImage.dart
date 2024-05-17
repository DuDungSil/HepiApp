import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


getEventImage (BuildContext context) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('http://'+serverIP+'/flt/eventImage'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  var _eventImageList = [];
  for (var _eventImage in jsonDecode(response.body)) {
    _eventImageList.add(new eventImage(_eventImage['id'], _eventImage['url']));
  }
  context.read<eventImages>().setEventImageList(_eventImageList);
}