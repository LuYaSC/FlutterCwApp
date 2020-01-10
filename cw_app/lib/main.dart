import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

final String assetName = 'assets/images/logo_blue.svg';
final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 14,
        navigateAfterSeconds: AfterSplash(),
        title: Text(
          'BCP Credinet Web',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image(
            image: AssetImage('assets/images/logobcpcircle-removebg.png'),
            fit: BoxFit.cover),
        backgroundColor: Color(0xFF002d74),
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 200.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Color(0xFFFF4F10));
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Welcome In SplashScreen Package"),
          automaticallyImplyLeading: false),
      body: new Center(
        child: new Text(
          "Done!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}
