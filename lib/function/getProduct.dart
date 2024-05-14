import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/store/products.dart';
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

  var _productList = [];
  for (var _product in jsonDecode(response.body)) {
    _productList.add(new product(_product['id'], _product['name'], _product['price'], _product['explain'], _product['event'], _product['mainImage']));
  }
  context.read<products>().setRecommendProductList(_productList);
}