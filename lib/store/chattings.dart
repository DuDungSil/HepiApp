import 'package:flutter/cupertino.dart';

class chattings extends ChangeNotifier {
  var chatList = [];

  setChatList(list) {
    chatList = list;
    notifyListeners();
  }
}

class chatting {

  var time;         //채팅 시간
  var gym_id;       //헬스장 아이디
  var user_id;      //유저 아이디
  var user_name;    //유저 이름
  var message;      //채팅 내용

  chatting(this.time, this.gym_id, this.user_id, this.user_name, this.message);

}
