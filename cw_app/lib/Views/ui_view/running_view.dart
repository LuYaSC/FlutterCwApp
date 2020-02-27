import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class RunningView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final bool isBol;

  const RunningView({Key key, this.animationController, this.animation, this.isBol})
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
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
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
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: SizedBox(
                                  height: 85,
                                  child: AspectRatio(
                                    aspectRatio: 1.714,
                                    child:
                                        this.isBol ? Image.asset("assets/images/BOL2.png") : Image.asset("assets/images/USD2.png"),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 45,
                                          right: 16,
                                          top: 16,
                                        ),
                                        child: Text(
                                          this.isBol ? "201-50173212-3-94" : "201-50738949-2-44",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily:
                                                FintnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            letterSpacing: 0.0,
                                            color: HexColor("#014B8E"),
                                            //FintnessAppTheme.nearlyDarkBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 45,
                                          right: 16,
                                          top: 1,
                                        ),
                                        child: Text(
                                          this.isBol ? "Remberto Mamani Hilaquita" : "Luis Jose Jimenez Peña",//"Saldo: 697.57",
                                          textAlign: TextAlign.left,
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
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 45,
                                      bottom: 12,
                                      top: 1,
                                      right: 5,
                                    ),
                                    child: Text(
                                      this.isBol ? "Saldo: 6697.57" : "Saldo: 10097.57",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: FintnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        letterSpacing: 0.0,
                                        color: HexColor("#f57328"),
                                        /*FintnessAppTheme.nearlyBlack
                                            .withOpacity(0.9),*/
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      /*Positioned(
                        top: -20,
                        left: 30,
                        child: SizedBox(
                          width: 55,
                          height: 150,
                          child: Image.asset("assets/images/logoTT.png"),
                        ),
                      )*/
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
