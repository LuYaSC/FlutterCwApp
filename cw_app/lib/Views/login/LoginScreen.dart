import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw_app/Views/login/FormCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  final bool isSelected = true;

 void _radio() {
    //setState(() {
      //isSelected = false;
    //});
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
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
                            child: radioButton(this.isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Recordarme",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium"))
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
                              onTap: () {},
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //horizontalLine(),
                      Image.asset(
                        "assets/images/logo3.png",
                        width: ScreenUtil.getInstance().setWidth(350),
                        height: ScreenUtil.getInstance().setHeight(350),
                      ),
                      /*Text("Social Login",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()*/
                    ],
                  ),
                  /*SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),*/
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        iconData: CustomIcons.googlePlus,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF00c6fb),
                          Color(0xFF005bea),
                        ],
                        iconData: CustomIcons.linkedin,
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: AutoSizeText(
                        "¿Es tu primera vez en Credinet Web? Genera tu clave ingresando",
                        maxLines: 5,
                        style: TextStyle(
                            fontFamily: "Poppins-Medium",
                            color: Color(0xFFf57328)),
                      )),
                      /*InkWell(
                        onTap: () {},
                        child: Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF014B8E),
                                fontFamily: "Poppins-Bold")),
                      )*/
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
