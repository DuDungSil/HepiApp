import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/init/startPage.dart';
import 'package:flutter_app/router.dart';
import 'package:flutter_app/utils/DBHelper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/store/chattings.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/store/gym.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_app/store/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'function/login.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: "properties.env");

  // SharedPreferences 초기화
  sharedPreferences = await SharedPreferences.getInstance();

  // sqflite DB 초기화
  DBHelper dbHelper = DBHelper();
  await dbHelper.initAllDatabase();

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
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    sharedPreferences.setBool('onboardingComplete', false);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    String? loginID = await secureStorage.read(key: 'loginID');
    if (loginID != null) {
      String? loginPWD = await secureStorage.read(key: 'loginPWD');
      await login(context, loginID, loginPWD!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

// HTTPS 비인증 SSL 허용
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}