import 'package:cw_app/Views/login/LoginScreen.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            //onClick: () => print("Flutter Egypt"),
            loaderColor: new Color(0xFFFF4F10)));
  }
}

