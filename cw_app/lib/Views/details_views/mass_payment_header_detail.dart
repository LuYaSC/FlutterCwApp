import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/mass_payment_header_result.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class MassPaymentHeaderDetail extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final MassPaymentHeaderResult header;
  final BatchPendingsCw batch;

  const MassPaymentHeaderDetail(
      {Key key,
      this.animationController,
      this.animation,
      this.header,
      this.batch})
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Lote: ${batch.id}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FintnessAppTheme.fontName,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            letterSpacing: 0.0,
                            color: FintnessAppTheme.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Operación: ${batch.operationType}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: FintnessAppTheme.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      header.statusOperation != null
                          ? Text(
                              'Estado: ${header.statusOperation}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
                      header.statusOperation != null
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      Text(
                        'Cta. origen: ${batch.account}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: FintnessAppTheme.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      header.paymentType != null
                          ? Text(
                              'Tipo de pago: ${header.paymentType}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
                      header.paymentType != null
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      Text(
                        'Importe: ${batch.amount} ${(batch.currency == 'BOL' ? 'BOLIVIANOS' : 'DOLARES')}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: FintnessAppTheme.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Debito por operacion: ${(header.isMultipleDebits ? 'MULTIPLE' : 'UNICO')}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: FintnessAppTheme.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      header.isTicket
                          ? Text(
                              'Ticket Preferencial: ${header.numberTicket}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
                      header.isTicket
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      header.isTicket
                          ? Text(
                              'Cambio Preferencial: ${header.preferentialExchange}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
                      header.isTicket
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      header.isScheduledProcess
                          ? Text(
                              'Fecha futura de proceso: ${header.scheduledProcess}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.0,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
                      header.isScheduledProcess
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      header.fundSource != null
                          ? Text(
                              'Origen de fondos: ${header.fundSource}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.1,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
                      header.fundSource != null
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      header.fundDestination != null
                          ? Text(
                              'Destino de fondos: ${header.fundDestination}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                letterSpacing: 0.1,
                                color: FintnessAppTheme.white,
                              ),
                            )
                          : Container(),
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
