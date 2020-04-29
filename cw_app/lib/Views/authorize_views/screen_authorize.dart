import 'dart:convert';
import 'package:cw_app/Services/API.dart';
import 'package:cw_app/Views/Models/authorize_batch.dart';
import 'package:cw_app/Views/Models/authorize_response.dart';
import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/popular_filter_list.dart';
import 'package:cw_app/Views/Models/range_slider_view.dart';
import 'package:cw_app/Views/Models/slider_view.dart';
import 'package:cw_app/Views/themes/hotel_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScreenAuthorize extends StatefulWidget {
  @override
  _ScreenAuthorizeState createState() => _ScreenAuthorizeState(
      this.isRejected, this.batch, this.operationDescription);
  final bool isRejected;
  final BatchPendingsCw batch;
  final String operationDescription;
  ScreenAuthorize(this.isRejected, this.batch, this.operationDescription);
}

class _ScreenAuthorizeState extends State<ScreenAuthorize> {
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;
  List<PopularFilterListData> accomodationListData =
      PopularFilterListData.operationList;

  final bool isRejected;
  final BatchPendingsCw batch;
  final String operationDescription;
  final password = TextEditingController(text: '');
  final reasonRejection = TextEditingController(text: '');
  String _token = '';
  List<AuthorizeResponse> bathAuthorize = new List<AuthorizeResponse>();
  AuthorizeBatch dto = new AuthorizeBatch();
  _ScreenAuthorizeState(this.isRejected, this.batch, this.operationDescription);

  RangeValues _values = const RangeValues(100, 600);
  double distValue = 50.0;

  Future<void> _getToken() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');

    if (!mounted) return;

    setState(() {
      _token = value;
    });
  }

  @override
  void initState() {
    this._getToken();
    super.initState();
  }

  void _authorizeBatch() {
    dto = new AuthorizeBatch();
    dto.batchIds.add(batch.id);
    dto.password = this.password.text;
    if (this.isRejected) {
      dto.operation = 3;
      dto.rejectionCause = reasonRejection.text;
      API.rejectedBatch(_token, dto).then((dynamic response) {
        setState(() {
          final Map<String, dynamic> result = jsonDecode(response.body);
          if (response.statusCode == 200) {
            if (result['isOk'] == true) {
              var listAuthorize = result['body'] as List;
              bathAuthorize = listAuthorize
                  .map((model) => AuthorizeResponse.fromJson(model))
                  .toList();
              _isAhorizedCorrectly(context, bathAuthorize[0].result);
            } else {
              _isAhorizedInCorrectly(context, result['message']);
            }
          } else {
            _isAhorizedInCorrectly(context, result['error_description']);
          }
        });
      });
    } else {
      dto.operation = batch.isBatchControl ? 1 : 2;
      API.authorizeBatch(_token, dto).then((dynamic response) {
        setState(() {
          final Map<String, dynamic> result = jsonDecode(response.body);
          if (response.statusCode == 200) {
            if (result['isOk'] == true) {
              var listAuthorize = result['body'] as List;
              bathAuthorize = listAuthorize
                  .map((model) => AuthorizeResponse.fromJson(model))
                  .toList();
              _isAhorizedCorrectly(context, bathAuthorize[0].result);
            } else {
              _isAhorizedInCorrectly(context, result['message']);
            }
          } else {
            _isAhorizedInCorrectly(context, result['error_description']);
          }
        });
      });
    }
  }

  closeModal() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _isAhorizedInCorrectly(BuildContext context, String description) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Error",
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => closeModal(),
          color: Color(0xFFf57328),
        ),
      ],
    ).show();
  }

  void closeAccModal() {
    Navigator.pushNamed(context, '/page');
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _isAhorizedCorrectly(BuildContext context, String description) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Operacion Exitosa",
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => closeAccModal(),
          color: Color(0xFFf57328),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HotelAppTheme.buildLightTheme().backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[allAccommodationUI(this.isRejected)],
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 8),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: HexColor('f57328'), //Color(0xFFf57328),
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
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
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      this._authorizeBatch();
                      //Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        this.operationDescription,
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
                height: 35,
                decoration: BoxDecoration(
                  color: Colors
                      .grey, //HotelAppTheme.buildLightTheme().primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
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
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget allAccommodationUI(bool isRejected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Lote",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              TextFormField(
                enabled: false,
                initialValue: this.batch.id.toString(),
                decoration: InputDecoration(
                    icon: new Icon(Icons.offline_pin),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(1),
              ),
              Text("Tipo de Operación",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              TextFormField(
                enabled: false,
                initialValue: this.batch.operationType,
                decoration: InputDecoration(
                    icon: new Icon(Icons.radio_button_checked),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(1),
              ),
              Text("Cuenta Origen",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              TextFormField(
                enabled: false,
                initialValue: this.batch.account,
                decoration: InputDecoration(
                    icon: new Icon(Icons.credit_card),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(1),
              ),
              Text("Importe",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              TextFormField(
                enabled: false,
                initialValue: '${this.batch.amount} '
                    '${(this.batch.currency == 'BOL' ? 'Bolivianos' : 'Dolares')}',
                decoration: InputDecoration(
                    icon: new Icon(Icons.monetization_on),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(1),
              ),
              Text("Beneficiarios",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              TextFormField(
                enabled: false,
                initialValue: this.batch.beneficiary,
                decoration: InputDecoration(
                    icon: new Icon(Icons.person),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              isRejected
                  ? Column(
                      children: <Widget>[
                        Text("Motivo de Rechazo",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xFF014B8E),
                                fontFamily: "Poppins-Medium",
                                fontSize: ScreenUtil.getInstance().setSp(26))),
                        TextField(
                          maxLength: 35,
                          controller: reasonRejection,
                          decoration: InputDecoration(
                              icon: new Icon(Icons.bug_report),
                              hintText: '',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(1),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: ScreenUtil.getInstance().setHeight(1),
                    ),
              Text("Clave de Internet",
                  style: TextStyle(
                      color: Color(0xFF014B8E),
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(26))),
              TextField(
                obscureText: true,
                maxLength: 35,
                controller: password,
                decoration: InputDecoration(
                    icon: new Icon(Icons.lock_open),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getAccomodationListUI() {
    final List<Widget> noList = <Widget>[];
    for (int i = 0; i < accomodationListData.length; i++) {
      final PopularFilterListData date = accomodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      date.titleTxt,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? Colors.orange[
                            900] /*HotelAppTheme.buildLightTheme().primaryColor*/
                        : Colors.grey.withOpacity(0.6),
                    onChanged: (bool value) {
                      setState(() {
                        checkAppPosition(i);
                      });
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(const Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (accomodationListData[0].isSelected) {
        accomodationListData.forEach((d) {
          d.isSelected = false;
        });
      } else {
        accomodationListData.forEach((d) {
          d.isSelected = true;
        });
      }
    } else {
      accomodationListData[index].isSelected =
          !accomodationListData[index].isSelected;

      int count = 0;
      for (int i = 0; i < accomodationListData.length; i++) {
        if (i != 0) {
          final PopularFilterListData data = accomodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == accomodationListData.length - 1) {
        accomodationListData[0].isSelected = true;
      } else {
        accomodationListData[0].isSelected = false;
      }
    }
  }

  Widget distanceViewUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Distance from city center',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChangedistValue: (double value) {
            distValue = value;
          },
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Estados de operacion',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getPList(),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPList() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    for (int i = 0; i < popularFilterListData.length / columnCount; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < columnCount; i++) {
        try {
          final PopularFilterListData date = popularFilterListData[count];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {
                      setState(() {
                        date.isSelected = !date.isSelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            date.isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: date.isSelected
                                ? HotelAppTheme.buildLightTheme().primaryColor
                                : Colors.grey.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            date.titleTxt,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
          count += 1;
        } catch (e) {
          print(e);
        }
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  Widget priceBarFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Price (for 1 night)',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          values: _values,
          onChangeRangeValues: (RangeValues values) {
            _values = values;
          },
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    //this._authorizeBatch();
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  operationDescription,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.blue[900]),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            ),
          ],
        ),
      ),
    );
  }
}
