import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw_app/Views/login/FormCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool isSelected = false;
  bool isAuthorized = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _canCheckBiometric = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBiometricTypes = List<BiometricType>();
  Widget screenView;
  AnimationController sliderAnimationController;

  void _radio() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });

    if (!mounted) return;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listofBiometrics;
    try {
      listofBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    setState(() {
      _availableBiometricTypes = listofBiometrics;
    });

    if (!mounted) return;
  }

  Future<void> _authorizeNow() async {
    try {
      isAuthorized = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: 'Please authenticate to complete your transaction',
        iOSAuthStrings: const IOSAuthMessages(
            cancelButton: 'cancel',
            goToSettingsButton: 'settings',
            goToSettingsDescription: 'Please set up your Touch ID.',
            lockOut: 'Please reenable your Touch ID'),
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (isAuthorized) {
      isAuthorized = true;
      Navigator.pushNamed(context, '/page');
    } else {
      isAuthorized = false;
    }
    setState(() {
      if (isAuthorized) {
        _authorizedOrNot = "Authorized";
      } else {
        _authorizedOrNot = "Not Authorized";
      }
    });
    //return isAuthorized;
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Color(0xFFf57328))),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFf57328)),
              )
            : Container(),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Image.asset("assets/images/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/images/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text("CredinetWeb",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins-Bold",
                              fontSize: ScreenUtil.getInstance().setSp(50),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  FormCard(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Recordarme",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF014B8E),
                                  fontFamily: "Poppins-Medium"))
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFFf57328),
                                Color(0xFFf57328)
                                //Color(0xFFFF4F10)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _checkBiometric();
                                if (_canCheckBiometric) {
                                  _authorizeNow();
                                } else {
                                  Navigator.pushNamed(context, '/page');
                                }
                              },
                              child: Center(
                                child: Text("INGRESAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  /*Text("Can we check Biometric : $_canCheckBiometric"),
                  RaisedButton(
                    onPressed: _checkBiometric,
                    child: Text("Check Biometric"),
                    color: Colors.red,
                    colorBrightness: Brightness.light,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Text(
                      "List Of Biometric : ${_availableBiometricTypes.toString()}"),
                  RaisedButton(
                    onPressed: _getListOfBiometricTypes,
                    child: Text("List of Biometric Types"),
                    color: Colors.red,
                    colorBrightness: Brightness.light,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Text("Authorized : $_authorizedOrNot"),
                  RaisedButton(
                    onPressed: _authorizeNow,
                    child: Text("Authorize now"),
                    color: Colors.red,
                    colorBrightness: Brightness.light,
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //horizontalLine(),
                      Image.asset(
                        'assets/images/logo4.png',
                        width: ScreenUtil.getInstance().setWidth(350),
                        height: ScreenUtil.getInstance().setHeight(350),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: AutoSizeText(
                        '¿Es tu primera vez en Credinet Web? Genera tu clave ingresando',
                        maxLines: 5,
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Color(0xFFf57328)),
                      )),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text("Aqui",
                        style: TextStyle(
                            color: Color(0xFF014B8E),
                            fontFamily: "Poppins-Bold")),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
