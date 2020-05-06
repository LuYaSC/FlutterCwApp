import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/mass_payment_detail_result.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class MultiplePaymentsDetail extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final MassPaymentDetailResult detail;

  const MultiplePaymentsDetail(
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
                                                text: 'Linea: ',
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
                                                text:
                                                    this.detail.line.toString(),
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
                                  detail.code != null
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
                                                      text: 'Código: ',
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
                                                      text: this.detail.code,
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
                                  (this.detail.paymentType != 'EFE')
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
                                                      text: 'Cuenta Destino: ',
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
                                                      text: this
                                                                  .detail
                                                                  .accountNumber !=
                                                              null
                                                          ? detail.accountNumber
                                                          : this
                                                                      .detail
                                                                      .destinationAccount !=
                                                                  null
                                                              ? detail
                                                                  .destinationAccount
                                                              : this.detail.targetAccount !=
                                                                      null
                                                                  ? detail
                                                                      .targetAccount
                                                                  : '',
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
                                                text: this
                                                    .detail
                                                    .amount
                                                    .toString(),
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
                                                text: 'Razon Beneficiario: ',
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
                                                text: this.detail.titularName,
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
                                  (detail.paymentType == 'EFE')
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
                                                      text: 'P. Apellido: ',
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
                                                          detail.firstLastName,
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
                                  (detail.paymentType == 'EFE')
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
                                                      text: 'S. Apellido: ',
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
                                                          detail.secondLastName,
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
                                  (detail.paymentType != 'ACH')
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
                                                      text: 'Tipo Documento: ',
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
                                                      text: detail.documentType !=
                                                              null
                                                          ? detail.documentType
                                                          : detail.typeIdc !=
                                                                  null
                                                              ? detail.typeIdc
                                                              : detail.typeDocument !=
                                                                      null
                                                                  ? detail
                                                                      .typeDocument
                                                                  : '',
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
                                  (detail.paymentType != 'ACH')
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
                                                      text: 'Documento: ',
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
                                                      text: detail.documentNumber !=
                                                              null
                                                          ? detail
                                                              .documentNumber
                                                          : detail.idc != null
                                                              ? detail.idc
                                                              : detail.document !=
                                                                      null
                                                                  ? detail
                                                                      .document
                                                                  : '',
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
                                  (detail.paymentType != 'ACH')
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
                                                          'Extension Documento: ',
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
                                                      text: detail.documentExtension !=
                                                              null
                                                          ? detail
                                                              .documentExtension
                                                          : detail.extensionIdc !=
                                                                  null
                                                              ? detail
                                                                  .extensionIdc
                                                              : detail.extensionDocument !=
                                                                      null
                                                                  ? detail
                                                                      .extensionDocument
                                                                  : '',
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
                                  (detail.paymentType == 'ACH')
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
                                                      text: 'Banco: ',
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
                                                      text: this
                                                          .detail
                                                          .bankDescription,
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
                                  (detail.paymentType == 'ACH' ||
                                          detail.paymentType == 'EFE')
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
                                                      text: 'Sucursal: ',
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
                                                      text: this
                                                          .detail
                                                          .branchOfficeDescription,
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
                                  (detail.paymentType == 'HAB' ||
                                          detail.paymentType == 'PROV')
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
                                                      text: 'P. Detalle: ',
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
                                                      text: this
                                                          .detail
                                                          .firstDetail,
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
                                  (detail.paymentType == 'HAB' ||
                                          detail.paymentType == 'PROV')
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
                                                      text: 'S. Detalle: ',
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
                                                      text: this
                                                          .detail
                                                          .secondDetail,
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
                                  (detail.paymentType == 'EFE' ||
                                          detail.paymentType == 'ACH')
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
                                                      text: 'Detalles: ',
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
                                                      text: detail.secondDetail,
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
                                  (detail.paymentType == 'EFE')
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
                                                      text: 'Instrucciones: ',
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
                                                      text: detail.instruccionsPayment !=
                                                              null
                                                          ? detail
                                                              .instruccionsPayment
                                                          : detail.instructions !=
                                                                  null
                                                              ? detail
                                                                  .instructions
                                                              : '',
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
                                  (detail.paymentType == 'HAB')
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
                                                      text: 'Celular: ',
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
                                                          .telephoneNumber,
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
                                            bottom: 5),
                                        child: RichText(
                                          text: new TextSpan(
                                            style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(
                                                text: 'E-Mail: ',
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
                                                text: detail.email != null
                                                    ? detail.email
                                                    : detail.mail != null
                                                        ? detail.mail
                                                        : detail.emailProvider !=
                                                                null
                                                            ? detail
                                                                .emailProvider
                                                            : '',
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
