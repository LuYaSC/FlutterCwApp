import 'package:cw_app/Views/login/inputWidget.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            ///holds email header and inputField
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(30.0, 0.0, 'Introduzca su Tarjeta'),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                padding: EdgeInsets.only(top: 40),
                            )),
                          ],
                        )),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(30.0, 0.0, 'Introduzca su Contraseña'),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(top: 40),
                            )),
                          ],
                        )),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            roundedRectButton("Ingresar", signInGradients, false),
          ],
        )
      ],
    );
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(mContext, '/page');
      },
      child: Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage("assets/ic_forward.png"),
                  size: 30,
                  color: Colors.white,
                )),
          ),
          /*IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(mContext, '/home');
            },
          )*/
        ],
      ),),);
  });
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
