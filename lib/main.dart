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
  void initState() {
    //SETTING FOR ANDROID
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // 원하는 색상으로 변경
      systemNavigationBarIconBrightness: Brightness.dark, // 아이콘 색상
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 원하는 배경색으로 설정
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: pageList[tab]),
        bottomNavigationBar: Bottombar(setTab: setTab),
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
