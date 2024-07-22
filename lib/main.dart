import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/init/startPage.dart';
import 'package:flutter_app/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/store/chattings.dart';
import 'package:flutter_app/store/eventImages.dart';
import 'package:flutter_app/store/gym.dart';
import 'package:flutter_app/store/products.dart';
import 'package:flutter_app/store/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: "properties.env");

  // Initialize SharedPreferences
  sharedPreferences = await SharedPreferences.getInstance();

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
