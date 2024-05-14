import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/product.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

getProduct (BuildContext context) async{
  var response = await http.post(
    Uri.parse('http://10.0.2.2:3573/flt/product'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': 'admin',
      'pwd': 'admin',
    }),
  );
  context.read<product>().setProduct(jsonDecode(response.body));
}