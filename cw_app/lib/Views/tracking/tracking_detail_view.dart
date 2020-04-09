import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/tracking_batch.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class TrackingDetailView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final TrackingBatch batch;

  const TrackingDetailView(
      {Key key, this.animationController, this.animation, this.batch})
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
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    //Colors.blue[900],
                    // FintnessAppTheme.nearlyDarkBlue,
                    //Color(0xFF014B8E),
                    HexColor("#014B8E"),
                    HexColor("#014B8E"),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(68.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FintnessAppTheme.grey.withOpacity(0.6),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Lote: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text: this.batch.id.toString(),
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                //fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Operacion: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text: this.batch.name,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                //fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Cuenta Origen: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text: this.batch.formattedAccount,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                //fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Importe: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text:
                                  '${this.batch.amount.toDouble()} ${this.batch.currency}',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                //fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Fecha de Creacion: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text: this.batch.dateCreation,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                //fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Fecha de Proceso: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text: this.batch.dateProcess,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                //fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Estado: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text: this.batch.description,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Fecha Futura: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text:
                                  '${(this.batch.isScheduledProcess ? this.batch.scheduledProcess : '-')}',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'Beneficiarios: ',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.orange[900],
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            new TextSpan(
                              text:
                                  '${(this.batch.beneficiary == null ? '-' : this.batch.beneficiary)}',
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: Colors.white, // HexColor("#014B8E"),
                                //FintnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 8),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: (this.batch.description == 'Procesado') ? 
                                HexColor('f57328') : HexColor('707070'), //HotelAppTheme.buildLightTheme().primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(24.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18.0)),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Comprobante General',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 8),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: (this.batch.description == 'Procesado') ? 
                                HexColor('f57328') : HexColor('707070'), //HotelAppTheme.buildLightTheme().primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(24.0)), 
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Comprobante Detallado',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 8),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: (this.batch.description == 'Procesado') ? 
                                HexColor('f57328') : HexColor('707070'), //HotelAppTheme.buildLightTheme().primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(24.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Comprobante Fraccionado',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 8),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFFf57328), //HotelAppTheme.buildLightTheme().primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(24.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18.0)),
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Aceptar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
