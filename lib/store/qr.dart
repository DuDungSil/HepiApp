import 'package:flutter/cupertino.dart';

class eventImages extends ChangeNotifier {
  var eventImageList = [];

  setEventImageList(list) {
    eventImageList = list;
    notifyListeners();
  }
}

class eventImage {
  var id;
  var url;

  eventImage(this.id, this.url);
}
