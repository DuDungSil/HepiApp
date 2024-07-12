import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../homePage/event.dart';
import '../homePage/home.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var tab = 0;

  setTab(index) {
    setState(() {
      tab = index;
    });
  }

  late List<Widget> pageList;

  @override
  void initState() {
    super.initState();
    pageList = [
      home(setTab: setTab),
      event(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return pageList[tab];
  }
}
