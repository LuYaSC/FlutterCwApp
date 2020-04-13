import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class GlassView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final String message;
  
  GlassView(
      {Key key,
      this.animationController,
      this.animation,
      this.message})
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
                      left: 24, right: 24, top: 5, bottom: 24),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("#D7E0F9"),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 68, bottom: 20, right: 16, top: 20),
                                child: Text(
                                  this.message,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: Colors.blue[
                                        900], /*FintnessAppTheme.nearlyDarkBlue
                                        .withOpacity(0.6),*/
                                  ),
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(
                                    left: 68, bottom: 12, right: 16, top: 12),
                                child: Text(
                                  '${this.batchforControl} Lotes por contorlar encontrados',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: Colors.blue[
                                        900], /*FintnessAppTheme.nearlyDarkBlue
                                        .withOpacity(0.6),*/
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 0,
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Icon(
                            Icons.info_outline,
                            size: 60,
                            color: Colors.orange[900],
                          ), //Image.asset("assets/fitness_app/glass.png"),
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
