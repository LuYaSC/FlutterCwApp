import 'package:cw_app/Views/login/login_screem.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
            seconds: 14,
            navigateAfterSeconds: AfterSplash(),
            title: Text(
              'Credinet Web',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            /*loadingText: Text(
          'Iniciando Cw',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
        ),*/
            image: Image(
                image: AssetImage('assets/images/logobcpcircle-removebg.png'),
                height: 310,
                width: 310,
                fit: BoxFit.cover),
            backgroundColor: Color(0xFF002d74),
            styleTextUnderTheLoader: TextStyle(),
            photoSize: 200.0,
            onClick: () => print("Flutter Egypt"),
            loaderColor: new Color(0xFFFF4F10)));
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return new LoginScreem();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreem(),
    );
  }
}
