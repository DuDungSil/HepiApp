import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

getProduct (BuildContext context, String type) async{
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('http://'+serverIP+'/flt/product/' + type),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': 'admin',
      'pwd': 'admin',
    }),
  );

  var _productList = [];
  for (var _product in jsonDecode(response.body)) {
    _productList.add(new product(_product['id'], _product['name'], _product['price'], _product['explain'], _product['event'], _product['main_image']));
  }
  context.read<products>().setRecommendProductList(_productList);
}