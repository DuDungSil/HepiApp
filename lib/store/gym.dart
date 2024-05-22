import 'package:flutter/cupertino.dart';

class gym extends ChangeNotifier {
  var id;
  var name;

  setGym(json) {
    this.id = json['id'];
    this.name = json['name'];
    notifyListeners();
  }
}