import 'package:flutter/cupertino.dart';

class product extends ChangeNotifier {
  var id;
  var name;
  var price;
  var explain;
  var event;
  var mainImage;

  setProduct(json) {
    this.id = json['id'];
    this.name = json['name'];
    this.price = json['price'];
    this.explain = json['explain'];
    this.event = json['event'];
    this.mainImage = json['mainImage'];
    notifyListeners();
  }
}