import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/services_pase_detail.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class ServicesPaseDetailView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final ServicesPaseDetail detail;

  const ServicesPaseDetailView(
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
                                  (detail.serviceCodeDescription != null &&
                                          detail.serviceCodeDescription != "")
                                      ? Row(
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
                                                      text: 'Forma de Pago: ',
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
                                                      text: detail
                                                          .serviceCodeDescription,
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
                                  (detail.parameters != null &&
                                          detail.parameters != "")
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
                                                      text:
                                                          'Código de servicio: ',
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
                                                      text: detail.parameters,
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
                                  (detail.nus != null &&
                                          detail.nus != "")
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
                                                      text: 'NUS: ',
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
                                                      text: detail.nus,
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
                                  (detail.accountNumber != null &&
                                          detail.accountNumber != "")
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
                                                      text: 'Nro. de Factura ',
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
                                                      text:
                                                          detail.accountNumber,
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
                                                text: 'Monto: ',
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
                                                text: detail.amount.toString(),
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
                                  (detail.clientName != null &&
                                          detail.clientName != "")
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
                                                      text: 'Cliente: ',
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
                                                      text: detail.clientName,
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
                                  detail.rejectionCause != null
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
                                                      text:
                                                          'Motivo de Rechazo: ',
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
                                                      text:
                                                          detail.rejectionCause,
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
