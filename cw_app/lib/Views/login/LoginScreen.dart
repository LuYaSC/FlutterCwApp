import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw_app/Services/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_ip/get_ip.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:rflutter_alert/rflutter_alert.dart';

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
  bool isSaveFingerprint = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBiometricTypes = List<BiometricType>();
  Widget screenView;
  AnimationController sliderAnimationController;
  final userName = TextEditingController(text: '90000100000');
  final password = TextEditingController(text: '');
  String _ip = 'Unknown';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _getListOfBiometricTypes();
    _checkBiometric();
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    String ipAddress;
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = 'Failed to get ipAddress.';
    }

    if (!mounted) return;

    setState(() {
      _ip = ipAddress;
    });
  }

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

  void _loginCw() {
    API.loginCw(userName.text, password.text, _ip).then((dynamic response) {
      setState(() {
        final Map<String, dynamic> result = jsonDecode(response.body);
        if (response.statusCode == 200) {
          final dynamic token = result['access_token'];
          storage.write(key: 'token', value: token);
          Navigator.pushNamed(context, '/page');
        } else {
          _onAlertButtonsPressed(context, result['error_description']);
        }
      });
    });
  }

  void closeModal() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _onAlertButtonsPressed(BuildContext context, String description) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Error",
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => this.closeModal(),
          color: Color(0xFFf57328),
        ),
      ],
    ).show();
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
                  Container(
                      width: double.infinity,
                      height: ScreenUtil.getInstance().setHeight(500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Text("Ingresar credenciales",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),*/
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Text("Numero de acceso o Alias",
                                style: TextStyle(
                                    color: Color(0xFF014B8E),
                                    fontFamily: "Poppins-Medium",
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            Expanded(
                              child: TextFormField(
                                controller: userName,
                                maxLength: 16,
                                //initialValue: '90000100000',
                                decoration: InputDecoration(
                                    icon: new Icon(Icons.credit_card),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Text("Clave de Internet",
                                style: TextStyle(
                                    color: Color(0xFF014B8E),
                                    fontFamily: "Poppins-Medium",
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(26))),
                            Expanded(
                              child: TextField(
                                controller: password,
                                obscureText: true,
                                maxLength: 35,
                                decoration: InputDecoration(
                                    icon: new Icon(Icons.lock_open),
                                    hintText: '',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.0)),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(35),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Cambiar Clave",
                                  style: TextStyle(
                                      color: Color(0xFF014B8E),
                                      fontFamily: "Poppins-Medium",
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(28)),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
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
                                if (_canCheckBiometric && isSaveFingerprint) {
                                  _authorizeNow();
                                } else {
                                  _loginCw();
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
