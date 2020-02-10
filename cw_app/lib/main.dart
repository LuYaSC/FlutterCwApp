import 'dart:io';
import 'package:cw_app/Views/login/LoginScreen.dart';
import 'package:cw_app/Views/themes/fitness_app_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FitnessAppHomeScreen> homeList = new List<FitnessAppHomeScreen>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SplashScreen(
              seconds: 10,
              navigateAfterSeconds: LoginScreen(),
              title: Text(
                'CredinetWeb',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins-Bold",
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              image: Image(
                  image: AssetImage('assets/images/logobcpcircle-removebg.png'),
                  height: 310,
                  width: 310,
                  fit: BoxFit.cover),
              backgroundColor: Color(0xFF002d74),
              styleTextUnderTheLoader: TextStyle(),
              photoSize: 150.0,
              loaderColor: new Color(0xFFFF4F10))),
      routes: {
        '/page': (BuildContext context) => FitnessAppHomeScreen(),
        //'/page1': (BuildContext context) => HomePage(),
        //'/page2': (BuildContext context) => HomePage()
      },
    );
  }
}
