import 'package:cw_app/Views/Models/bill_address_cresag.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class CresagAddressView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final BillAddressCresag detail;

  const CresagAddressView(
      {Key key, this.animationController, this.animation, this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 0, bottom: 0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FintnessAppTheme.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: FintnessAppTheme.grey.withOpacity(0.5),
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              /*ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: SizedBox(
                                  height: 85,
                                  width: 45,
                                  child: AspectRatio(
                                    aspectRatio: 1.714,
                                    child: this.isBol
                                        ? Image.asset("assets/images/logoTT.png")
                                        : Image.asset("assets/images/logoTT.png"),
                                  ),
                                ),
                              ),*/
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 5,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: '${detail.streetType}: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.streetName,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 1,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'Zona: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.neighborhood,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 1,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'Nro.: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.doorNumber,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  detail.floor != null
                                      ? Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 5,
                                                right: 12,
                                                top: 1,
                                              ),
                                              child: RichText(
                                                text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                      text: 'Depto/Piso: ',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FintnessAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Colors.orange[900],
                                                        //FintnessAppTheme.nearlyDarkBlue,
                                                      ),
                                                    ),
                                                    new TextSpan(
                                                      text: detail.floor,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FintnessAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                        color:
                                                            HexColor("#014B8E"),
                                                        //FintnessAppTheme.nearlyDarkBlue,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  (detail.city != null && detail.city != "") ? Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 1,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'Departamento: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.city,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) :Container(),
                                  (detail.province != null && detail.province != "") ?Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 1,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'Provincia: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.province,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) : Container(),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 1,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'Localidad: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.location,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          right: 12,
                                          top: 1,
                                        ),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'Urb./Condominio: ',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: Colors.orange[900],
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                              new TextSpan(
                                                text: detail.urbanization,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FintnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: HexColor("#014B8E"),
                                                  //FintnessAppTheme.nearlyDarkBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
