import 'package:flutter/cupertino.dart';

class user extends ChangeNotifier {
  var id;
  var pwd;
  var name;
  var phone;
  var gym_name;

  Future<void> setUser(json) async {
    this.id = json['id'];
    this.pwd = json['pwd'];
    this.name = json['name'];
    this.phone = json['phone'];
    this.gym_name = json['gym_name'];
    notifyListeners();
  }

  String getQr()
  {
    return this.id;
  }

  logout() {
    this.id = null;
    this.pwd = null;
    this.name = null;
    this.phone = null;
    this.gym_name = null;
    notifyListeners();
  }
}