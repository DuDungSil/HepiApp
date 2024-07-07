import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/function/getEventImage.dart';
import 'package:flutter_app/function/getProduct.dart';

import '../home/event.dart';
import '../home/home.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var pageList = [
    home(),
    event(),
  ];
  var tab = 0;

  setTab(index) {
    setState(() {
      tab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return pageList[tab];
  }
}
