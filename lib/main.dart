import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/pages/main/homePage.dart';
import 'package:flutter_app/pages/main/myPage.dart';
import 'package:flutter_app/pages/main/healthcarePage.dart';
import 'package:flutter_app/pages/main/qrPage.dart';
import 'package:flutter_app/store/chattings.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/store/gym.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_app/widgets/bottombar.dart';
import 'package:flutter_app/pages/main/searchPage.dart';
import 'package:flutter_app/store/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: "properties.env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => gym()),
        ChangeNotifierProvider(create: (c) => user()),
        ChangeNotifierProvider(create: (c) => products()),
        ChangeNotifierProvider(create: (c) => chattings()),
        ChangeNotifierProvider(create: (c) => eventImages()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pageList = [
    homePage(),
    searchPage(),
    myPage(),
    healthcarePage(),
    qrPage()
  ];
  var tab = 0;

  setTab(index) {
    setState(() {
      tab = index;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: pageList[tab],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Bottombar(setTab: setTab),
            ),
          ],
        ),
      ),
    );
  }
}

// HTTPS 비인증 SSL 허용
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}