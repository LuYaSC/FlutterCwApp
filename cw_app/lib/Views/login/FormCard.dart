import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
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
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              Expanded(
                child: TextFormField(
                  maxLength: 16,
                  initialValue: '90000100000',
                  decoration: InputDecoration(
                      icon: new Icon(Icons.credit_card),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Text("Clave de Internet",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              Expanded(
                child: TextField(
                  obscureText: true,
                  maxLength: 35,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.lock_open),
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
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
                        fontSize: ScreenUtil.getInstance().setSp(28)),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
