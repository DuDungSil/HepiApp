import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/function/getProduct.dart';

import 'package:flutter_app/pages/homePage.dart';
import 'package:flutter_app/pages/myPage.dart';
import 'package:flutter_app/pages/chattingPage.dart';
import 'package:flutter_app/pages/qrPage.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_app/widget/bottombar.dart';
import 'package:flutter_app/pages/searchPage.dart';
import 'package:flutter_app/store/user.dart';
import 'package:provider/provider.dart';

import 'function/login.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (c) => user()),
      ChangeNotifierProvider(create: (c) => products()),
    ], child: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pageList;
  var tab = 0;

  setTab(a) {
    setState(() {
      tab = a;
    });
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    pageList = [homePage(), searchPage(), myPage(), chattingPage(), qrPage()];
  }

  @override
  Widget build(BuildContext context) {
    login(context);
    getProduct(context);

    return MaterialApp(
      title: 'Flutter App',
      home: SafeArea(
        child: Scaffold(
          body: pageList[tab],
          bottomNavigationBar: Bottombar(setTab: setTab),
        ),
      ),
    );
  }
}
