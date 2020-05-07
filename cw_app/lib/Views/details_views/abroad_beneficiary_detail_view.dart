import 'package:cw_app/Views/Models/transfer_abroad_detail.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/utils/utils_views.dart';
import 'package:flutter/material.dart';

class AbroadBeneficiaryDetaiView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final TransferAbroadDetail detail;

  const AbroadBeneficiaryDetaiView(
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
                                  utils.rowlist('Nombre o Razón Social',
                                      detail.beneficiaryBusinessName, true),
                                  utils.rowlist('Número de documento',
                                      detail.beneficiaryDocumentNumber),
                                  utils.rowlist(
                                      'Tipo', detail.beneficiaryDocumentType),
                                  detail.isTicketCommission
                                      ? utils.rowlist(
                                          'Número de cuenta/IBAN (Europa)',
                                          detail.beneficiaryNumberAccount)
                                      : Container(),
                                  utils.rowlist('Concepto de pago',
                                      detail.beneficiaryPaymentConcept),
                                  utils.rowlist(
                                      'Dirección', detail.beneficiaryAddress),
                                  utils.rowlist('Ciudad de residencia',
                                      detail.beneficiaryCityResidence),
                                  utils.rowlist('País de residencia',
                                      detail.beneficiaryCountryResidence),
                                  utils.rowlist(
                                      'Teléfono', detail.beneficiaryPhone),
                                  utils.rowlist('Correo electrónico',
                                      detail.beneficiaryEmail),
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
