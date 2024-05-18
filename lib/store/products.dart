import 'package:flutter/cupertino.dart';


class products extends ChangeNotifier {

  var recommendProductList = [];
  var myProductList = [];

  setRecommendProductList(list) {
    recommendProductList = list;
    notifyListeners();
  }

  setMyProductList(list) {
    myProductList = list;
    notifyListeners();
  }
}

class product {

  var id;
  var name;
  var price;
  var explain;
  var event;
  var main_image;
  var amount;
  var unit;

  product(this.id, this.name, this.price, this.explain, this.event, this.main_image, this.amount, this.unit);

}

class myProduct {

  var id;
  var name;
  var price;
  var explain;
  var event;
  var main_image;
  var my_amount;
  var amount;
  var unit;

  myProduct(this.id, this.name, this.price, this.explain, this.event, this.main_image, this.my_amount, this.amount, this.unit);

}
