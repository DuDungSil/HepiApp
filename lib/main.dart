import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/pages/main/homePage.dart';
import 'package:flutter_app/pages/main/myPage.dart';
import 'package:flutter_app/pages/main/chattingPage.dart';
import 'package:flutter_app/pages/main/qrPage.dart';
import 'package:flutter_app/store/chattings.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/store/gym.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_app/widget/bottombar.dart';
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
  var pageList = [homePage(), searchPage(), myPage(), chattingPage(), qrPage()];
  var tab = 0;

  setTab(a) {
    setState(() {
      tab = a;
    });
  }

  @override
  void initState() { }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xFFFFFFFF),
              body: pageList[tab], //registerPage()
              bottomNavigationBar: Bottombar(setTab: setTab),
            ),
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
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
