import 'package:flutter/cupertino.dart';


class products extends ChangeNotifier {

  var recommendProductList = [];

  setRecommendProductList(list) {
    recommendProductList = list;
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

  product(this.id, this.name, this.price, this.explain, this.event, this.main_image);

}
