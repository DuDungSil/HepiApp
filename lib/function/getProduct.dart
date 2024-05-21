import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../store/products.dart';


getProduct (BuildContext context, String type, String userID) async {
  print("Connect to Server");
  var serverIP = dotenv.get("serverIP");
  var response = await http.post(
    Uri.parse('https://' + serverIP + '/flt/product/' + type),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': userID,
    }),
  );

  var _productList = [];
  for (var _product in jsonDecode(response.body)) {
    _productList.add(new product(_product['id'], _product['name'], _product['price'], _product['explain'], _product['event'], _product['main_image'], _product['my_amount'], _product['amount'], _product['unit'], _product['discount']));
  }
  context.read<products>().setProductList(type, _productList);
}