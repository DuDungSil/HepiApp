import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app/pages/main/homePage.dart';
import 'package:flutter_app/pages/main/myPage.dart';
import 'package:flutter_app/pages/main/chattingPage.dart';
import 'package:flutter_app/pages/main/qrPage.dart';
import 'package:flutter_app/pages/user/registerPage.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_app/widget/bottombar.dart';
import 'package:flutter_app/pages/main/searchPage.dart';
import 'package:flutter_app/store/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 1번코드
  await dotenv.load(fileName: "properties.env");    // 2번코드

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => user()),
        ChangeNotifierProvider(create: (c) => products()),
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: SafeArea(
        child: Scaffold(
          body: registerPage()//pageList[tab],
          //bottomNavigationBar: Bottombar(setTab: setTab),
        ),
      ),
    );
  }
}
