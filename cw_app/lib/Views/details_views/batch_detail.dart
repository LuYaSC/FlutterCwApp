import 'dart:convert';

import 'package:cw_app/Services/API.dart';
import 'package:cw_app/Views/Models/abroad_detail_gpi.dart';
import 'package:cw_app/Views/Models/afp_detail_result.dart';
import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/bill_address_cresag.dart';
import 'package:cw_app/Views/Models/cresag_detail.dart';
import 'package:cw_app/Views/Models/mass_payment_detail_result.dart';
import 'package:cw_app/Views/Models/mass_payment_header_result.dart';
import 'package:cw_app/Views/Models/services_pase_detail.dart';
import 'package:cw_app/Views/Models/telephony_detail.dart';
import 'package:cw_app/Views/Models/transfer_abroad_detail.dart';
import 'package:cw_app/Views/Models/transfer_abroad_header.dart';
import 'package:cw_app/Views/Models/transfer_detail_result.dart';
import 'package:cw_app/Views/Models/users_involved.dart';
import 'package:cw_app/Views/details_views/abroad_bank_dates_view.dart';
import 'package:cw_app/Views/details_views/abroad_beneficiary_detail_view.dart';
import 'package:cw_app/Views/details_views/abroad_gpi_view.dart';
import 'package:cw_app/Views/details_views/abroad_requester_dates_view.dart';
import 'package:cw_app/Views/details_views/afp_detail_view.dart';
import 'package:cw_app/Views/details_views/cresag_address_view.dart';
import 'package:cw_app/Views/details_views/cresag_detail.dart';
import 'package:cw_app/Views/details_views/mass_payment_detail.dart';
import 'package:cw_app/Views/details_views/multiple_payments_detail.dart';
import 'package:cw_app/Views/details_views/services_pase_detail_view.dart';
import 'package:cw_app/Views/details_views/services_pase_header_view.dart';
import 'package:cw_app/Views/details_views/telephony_detail_view.dart';
import 'package:cw_app/Views/details_views/transfer_abroad_header_view.dart';
import 'package:cw_app/Views/details_views/transfer_detail.dart';
import 'package:cw_app/Views/details_views/user_involveds_view.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/ui_view/title_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'mass_payment_header_detail.dart';

class Batchdetail extends StatefulWidget {
  const Batchdetail({Key key, this.animationController, this.batch})
      : super(key: key);

  final AnimationController animationController;
  final BatchPendingsCw batch;
  @override
  _BatchdetailState createState() => _BatchdetailState(batch);
}

class _BatchdetailState extends State<Batchdetail>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  String _token = '';
  bool _isFetching = false;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  BatchPendingsCw batch;
  TrasnferDetailResult transferDetail = new TrasnferDetailResult();
  List<UserInvolved> usersInvolved = new List<UserInvolved>();
  List<MassPaymentDetailResult> massPaymentDetails =
      new List<MassPaymentDetailResult>();
  MassPaymentHeaderResult massPaymentHeader = new MassPaymentHeaderResult();
  List<MassPaymentDetailResult> salariesPaymentDetails =
      new List<MassPaymentDetailResult>();
  List<MassPaymentDetailResult> providersPaymentDetails =
      new List<MassPaymentDetailResult>();
  List<MassPaymentDetailResult> cashPaymentDetails =
      new List<MassPaymentDetailResult>();
  List<MassPaymentDetailResult> achPaymentDetails =
      new List<MassPaymentDetailResult>();
  TelephonyDetail telephonyDetail = new TelephonyDetail();
  List<ServicesPaseDetail> servicesPaseDetails = new List<ServicesPaseDetail>();
  AfpDetailResult afpDetail = new AfpDetailResult();
  BillAddressCresag addressCreSag = new BillAddressCresag();
  List<CresagDetail> cresagDetail = new List<CresagDetail>();
  TransferAbroadHeader abroadHeader = new TransferAbroadHeader();
  TransferAbroadDetail abroadDetail = new TransferAbroadDetail();
  List<AbroadDetailGPI> abroadGpiDetail = new List<AbroadDetailGPI>();

  _BatchdetailState(BatchPendingsCw batch) {
    this.batch = batch;
  }

  Widget viewCharge() {
    return _isFetching
        ? Positioned.fill(
            child: Container(
            child: CupertinoActivityIndicator(radius: 15),
          ))
        : Container();
  }

  Future<void> _getToken() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');

    if (!mounted) return;

    setState(() {
      _token = value;
      _isFetching = true;
      _getDetailBatches(batch.operationTypeId, batch.operationType);
    });
  }

  Future<void> _getDetailBatches(int operationTypeId, String operationType) {
    switch (operationTypeId) {
      case 15:
        API.getDetailTransfer(_token, this.batch.id).then((dynamic response) {
          setState(() {
            _isFetching = false;
            dynamic aux = response.body;
            Map<String, dynamic> aux2 = jsonDecode(aux);
            dynamic isOk = aux2["isOk"];
            transferDetail = TrasnferDetailResult.fromJson(aux2['body']);
            var userInvolved = aux2['body']['userInvolveds'] as List;
            usersInvolved = userInvolved
                .map((model) => UserInvolved.fromJson(model))
                .toList();
            transferViewData();
          });
        });
        break;
      case 8:
      case 16:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
        API.getDetailMassPayments(_token, this.batch).then((dynamic response) {
          setState(() {
            dynamic aux = response.body;
            Map<String, dynamic> aux2 = jsonDecode(aux);
            dynamic isOk = aux2["isOk"];
            massPaymentHeader = MassPaymentHeaderResult.fromJson(aux2['body']);
            var spreds = aux2['body']['spreadsheet'] as List;
            massPaymentDetails = spreds
                .map((model) => MassPaymentDetailResult.fromJson(model))
                .toList();
            var userInvolved = aux2['body']['userInvolveds'] as List;
            usersInvolved = userInvolved
                .map((model) => UserInvolved.fromJson(model))
                .toList();
            massPaymentViewData();
            _isFetching = false;
          });
        });
        break;
      case 20:
      case 23:
        API
            .getDetailMultiplePayments(_token, this.batch)
            .then((dynamic response) {
          setState(() {
            dynamic aux = response.body;
            Map<String, dynamic> aux2 = jsonDecode(aux);
            dynamic isOk = aux2["isOk"];
            massPaymentHeader = MassPaymentHeaderResult.fromJson(aux2['body']);
            var salariesspreds =
                aux2['body']['spreadsheet']['formSalariesPayments'] as List;
            var providersspreds =
                aux2['body']['spreadsheet']['formProvidersPayments'] as List;
            var cashspreds =
                aux2['body']['spreadsheet']['formCashPayments'] as List;
            var achspreds =
                aux2['body']['spreadsheet']['formAchPayments'] as List;
            salariesPaymentDetails = salariesspreds
                .map((model) => MassPaymentDetailResult.fromJson(model))
                .toList();
            providersPaymentDetails = providersspreds
                .map((model) => MassPaymentDetailResult.fromJson(model))
                .toList();
            cashPaymentDetails = cashspreds
                .map((model) => MassPaymentDetailResult.fromJson(model))
                .toList();
            achPaymentDetails = achspreds
                .map((model) => MassPaymentDetailResult.fromJson(model))
                .toList();
            var userInvolved = aux2['body']['userInvolveds'] as List;
            usersInvolved = userInvolved
                .map((model) => UserInvolved.fromJson(model))
                .toList();
            multiplePaymentViewData();
            _isFetching = false;
          });
        });
        break;
      case 10:
        API
            .getDetailTelephonyPayments(_token, this.batch.id)
            .then((dynamic response) {
          setState(() {
            dynamic aux = response.body;
            Map<String, dynamic> aux2 = jsonDecode(aux);
            dynamic isOk = aux2["isOk"];
            telephonyDetail = TelephonyDetail.fromJson(aux2['body']);
            var userInvolved = aux2['body']['userInvolveds'] as List;
            usersInvolved = userInvolved
                .map((model) => UserInvolved.fromJson(model))
                .toList();
            telephonyViewData();

            _isFetching = false;
          });
        });
        break;
      case 33:
      case 32:
        API
            .getDetailPasePayments(
                _token, this.batch.id, this.batch.operationTypeId)
            .then((dynamic response) {
          setState(() {
            dynamic aux = response.body;
            Map<String, dynamic> aux2 = jsonDecode(aux);
            dynamic isOk = aux2["isOk"];
            var paseDetails = aux2['body']['detail'] as List;
            servicesPaseDetails = paseDetails
                .map((model) => ServicesPaseDetail.fromJson(model))
                .toList();
            var userInvolved = aux2['body']['userInvolveds'] as List;
            usersInvolved = userInvolved
                .map((model) => UserInvolved.fromJson(model))
                .toList();
            servicesPaseViewData();
            _isFetching = false;
          });
        });
        break;
      case 9:
        if (operationType.contains('AFP')) {
          API.getAfpPayments(_token, this.batch.id).then((dynamic response) {
            setState(() {
              dynamic aux = response.body;
              Map<String, dynamic> aux2 = jsonDecode(aux);
              dynamic isOk = aux2["isOk"];
              afpDetail = AfpDetailResult.fromJson(aux2['body']);
              var userInvolved = aux2['body']['userInvolveds'] as List;
              usersInvolved = userInvolved
                  .map((model) => UserInvolved.fromJson(model))
                  .toList();
              sericesViewData();
              _isFetching = false;
            });
          });
        }
        if (operationType.contains('CRE') || operationType.contains('SAG')) {
          API.getCreSagPayments(_token, this.batch.id).then((dynamic response) {
            setState(() {
              dynamic aux = response.body;
              Map<String, dynamic> aux2 = jsonDecode(aux);
              dynamic isOk = aux2["isOk"];
              addressCreSag =
                  BillAddressCresag.fromJson(aux2['body']['billAddress']);
              var creDetails = aux2['body']['detail'] as List;
              cresagDetail = creDetails
                  .map((model) => CresagDetail.fromJson(model))
                  .toList();
              var userInvolved = aux2['body']['userInvolveds'] as List;
              usersInvolved = userInvolved
                  .map((model) => UserInvolved.fromJson(model))
                  .toList();
              creSagServicesViewData();
              _isFetching = false;
            });
          });
        }
        break;
      case 7:
        API
            .getTransferAbroadPayments(_token, this.batch.id)
            .then((dynamic response) {
          setState(() {
            dynamic aux = response.body;
            Map<String, dynamic> aux2 = jsonDecode(aux);
            dynamic isOk = aux2["isOk"];
            abroadHeader = TransferAbroadHeader.fromJson(aux2['body']);
            API
                .getTransferAbroadDetailPayments(_token, this.batch.id)
                .then((dynamic response) {
              setState(() {
                dynamic aux = response.body;
                Map<String, dynamic> aux2 = jsonDecode(aux);
                dynamic isOk = aux2["isOk"];
                abroadDetail = TransferAbroadDetail.fromJson(aux2['body']);
                API
                    .getTransferAbroadGPI(_token, this.batch.id)
                    .then((dynamic response) {
                  setState(() {
                    dynamic aux = response.body;
                    Map<String, dynamic> aux2 = jsonDecode(aux);
                    dynamic isOk = aux2["isOk"];
                    if (isOk) {
                      var gpiDetail = aux2['body'] as List;
                      abroadGpiDetail = gpiDetail
                          .map((model) => AbroadDetailGPI.fromJson(model))
                          .toList();
                      abroadHeaderViewData();
                      abroadGPIViewData();
                      abroadDetailViewData();
                    } else {
                      abroadHeaderViewData();
                      abroadDetailViewData();
                    }
                    _isFetching = false;
                  });
                });
                
              });
            });
          });
        });
        break;
    }
  }

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
    this._getToken();
  }

  void abroadGPIViewData() {
    const int count = 5;

    listViews.add(
      TitleView(
        titleTxt: 'Rastreo GPI',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < abroadGpiDetail.length; i++) {
      listViews.add(
        AbroadGpiView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: abroadGpiDetail[i]),
      );
    }
  }

  void abroadDetailViewData() {
    const int count = 5;

    listViews.add(
      TitleView(
        titleTxt: 'Datos del Solicitante',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      AbroadRequesterDatesView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        detail: abroadDetail,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Datos del Beneficiario',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      AbroadBeneficiaryDetaiView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        detail: abroadDetail,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Datos del Banco Pagador',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      AbroadBankDatesView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        detail: abroadDetail,
      ),
    );
  }

  void abroadHeaderViewData() {
    const int count = 5;

    listViews.add(
      TransferAbroadHeaderView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: abroadHeader,
      ),
    );
  }

  void multiplePaymentViewData() {
    const int count = 5;
    listViews.add(
      MassPaymentHeaderDetail(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: batch,
        header: massPaymentHeader,
      ),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }

    if (salariesPaymentDetails.length > 0) {
      listViews.add(
        TitleView(
          titleTxt: 'Pago de Haberes',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 0, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );

      for (var i = 0; i < salariesPaymentDetails.length; i++) {
        listViews.add(
          MultiplePaymentsDetail(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: salariesPaymentDetails[i],
          ),
        );
      }
    }

    if (providersPaymentDetails.length > 0) {
      listViews.add(
        TitleView(
          titleTxt: 'Pago de Proveedores',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 0, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );

      for (var i = 0; i < providersPaymentDetails.length; i++) {
        listViews.add(
          MultiplePaymentsDetail(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: providersPaymentDetails[i],
          ),
        );
      }
    }

    if (cashPaymentDetails.length > 0) {
      listViews.add(
        TitleView(
          titleTxt: 'Pagos en Efectivo',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 0, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );

      for (var i = 0; i < cashPaymentDetails.length; i++) {
        listViews.add(
          MultiplePaymentsDetail(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: cashPaymentDetails[i],
          ),
        );
      }
    }

    if (achPaymentDetails.length > 0) {
      listViews.add(
        TitleView(
          titleTxt: 'Pagos ACH',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 0, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );

      for (var i = 0; i < achPaymentDetails.length; i++) {
        listViews.add(
          MultiplePaymentsDetail(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: achPaymentDetails[i],
          ),
        );
      }
    }
  }

  void massPaymentViewData() {
    const int count = 5;
    listViews.add(
      MassPaymentHeaderDetail(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: batch,
        header: massPaymentHeader,
      ),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }

    listViews.add(
      TitleView(
        titleTxt: 'Detalle pagos masivos',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < massPaymentDetails.length; i++) {
      listViews.add(
        MassPaymentDetail(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 3, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          detail: massPaymentDetails[i],
          batch: batch,
        ),
      );
    }
  }

  void sericesViewData() {
    const int count = 5;

    listViews.add(
      AfpDetailView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        detail: afpDetail,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }
  }

  void creSagServicesViewData() {
    const int count = 5;

    listViews.add(
      ServicesPaseHeaderView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: batch,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }

    listViews.add(
      TitleView(
        titleTxt: 'Dirección de la factura',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      CresagAddressView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        detail: addressCreSag,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Pagos registrados',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < cresagDetail.length; i++) {
      listViews.add(
        CresagDetailView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: cresagDetail[i]),
      );
    }
  }

  void servicesPaseViewData() {
    const int count = 5;

    listViews.add(
      ServicesPaseHeaderView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: batch,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }

    listViews.add(
      TitleView(
        titleTxt: 'Detalle servicio',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < servicesPaseDetails.length; i++) {
      listViews.add(
        ServicesPaseDetailView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            detail: servicesPaseDetails[i]),
      );
    }
  }

  void telephonyViewData() {
    const int count = 5;

    listViews.add(
      TelephonyDetailView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: batch,
        detail: telephonyDetail,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }
  }

  void transferViewData() {
    const int count = 5;

    listViews.add(
      TransferDetail(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        batch: batch,
        transfer: transferDetail,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Usuarios Involucrados en la operación',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    for (var i = 0; i < usersInvolved.length; i++) {
      listViews.add(
        UserInvolvedsViews(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 3, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            user: usersInvolved[i]),
      );
    }
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            viewCharge(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FintnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FintnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Detalle Operación',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: FintnessAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 8),
                              child: Container(
                                height: 48,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SizedBox(
                                      height: 38,
                                      width: 38,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(32.0)),
                                        child: Center(
                                          child: Icon(
                                            Icons.clear,
                                            color: FintnessAppTheme.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
