import 'package:cw_app/Views/Models/transfer_abroad_detail.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/utils/utils_views.dart';
import 'package:flutter/material.dart';

class AbroadRequesterDatesView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final TransferAbroadDetail detail;

  const AbroadRequesterDatesView(
      {Key key, this.animationController, this.animation, this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UtilsViews utils = new UtilsViews(context);
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
                              Column(
                                children: <Widget>[
                                  utils.rowlist('Ordenante',
                                      detail.requesterBusinessName, true),
                                  utils.rowlist('Cuenta Debito',
                                      detail.requesterNumberAccount),
                                  utils.rowlist('Importe Destino',
                                      '${detail.destinationAmount} ${detail.currency}'),
                                  detail.isTicketCommission
                                      ? utils.rowlist('Ticket Comisión',
                                          detail.payerBankAddress)
                                      : Container(),
                                  detail.isTicket
                                      ? utils.rowlist('Ticket Dólar',
                                          '${detail.numberTicket} TC=${detail.preferentialExchange}')
                                      : Container(),
                                  utils.rowlist(
                                      'Dirección', detail.requesterAddress),
                                  utils.rowlist(
                                      'Teléfono', detail.requesterPhone),
                                  utils.rowlist('Detalle de cargos',
                                      detail.detailCharges),
                                  utils.rowlist('Correo electrónico',
                                      detail.requesterEmail),
                                  utils.rowlist('Motivo transferencia',
                                      detail.beneficiaryPaymentConcept),
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
