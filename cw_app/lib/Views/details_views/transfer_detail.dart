import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/transfer_detail_result.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class TransferDetail extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final TrasnferDetailResult transfer;
  final BatchPendingsCw batch;

  const TransferDetail(
      {Key key,
      this.animationController,
      this.animation,
      this.transfer,
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
                      Text(
                        'Estado: ${transfer.batchStatus}',
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
                        'Cta. origen: ${transfer.sourceAccount}',
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
                        'Cta. destino: ${transfer.destinationAccount}',
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
                        'Importe: ${transfer.amount} ${(transfer.currency == 'BOL' ? 'BOLIVIANOS' : 'DOLARES')}',
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
                        'Destinatario: ${transfer.beneficiary}',
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
                      transfer.ticketNumber != 0
                          ? Text(
                              'Ticket Preferencial: ${transfer.ticketNumber}',
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
                      transfer.ticketNumber != 0
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      transfer.ticketNumber != 0
                          ? Text(
                              'Cambio Preferencial: ${transfer.preferentialExchange}',
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
                      transfer.ticketNumber != 0
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      transfer.isScheduledProcess
                          ? Text(
                              'Fecha futura de proceso: ${transfer.scheduledProcessDate}',
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
                      transfer.isScheduledProcess
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      transfer.bank != ""
                          ? Text(
                              'Banco Destino: ${transfer.bank}',
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
                      transfer.bank != ""
                          ? SizedBox(
                              height: 6,
                            )
                          : Container(),
                      transfer.branchOffice != ""
                          ? Text(
                              'Sucursal: ${transfer.branchOffice}',
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Origen de fondos: ${transfer.fundSource}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.1,
                          color: FintnessAppTheme.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Destino de fondos: ${transfer.fundDestination}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          letterSpacing: 0.1,
                          color: FintnessAppTheme.white,
                        ),
                      ),
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
