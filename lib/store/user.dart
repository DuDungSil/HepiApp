import 'package:flutter/cupertino.dart';

class user extends ChangeNotifier {
  var id;
  var pwd;
  var name;
  var phone;
  var gym;

  setUser(json) {
    this.id = json['id'];
    this.pwd = json['pwd'];
    this.name = json['name'];
    this.phone = json['phone'];
    this.gym = json['gym'];
    notifyListeners();
  }
}