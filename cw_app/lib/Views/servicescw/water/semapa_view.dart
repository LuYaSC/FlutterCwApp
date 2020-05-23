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
import 'package:cw_app/Views/ui_view/title_view.dart';
import 'package:cw_app/Views/utils/utils_views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:focus_widget/focus_widget.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SemapaView extends StatefulWidget {
  @override
  _SemapaViewState createState() => _SemapaViewState(this.isRejected, this.batch,
      this.operationDescription, this.animationController);

  final AnimationController animationController;
  final bool isRejected;
  final BatchPendingsCw batch;
  final String operationDescription;
  SemapaView(this.isRejected, this.batch, this.operationDescription,
      this.animationController);
}

class _SemapaViewState extends State<SemapaView> {
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.authList;
  List<PopularFilterListData> accomodationListData =
      PopularFilterListData.operationList;
  AnimationController animationController;
  final FocusNode _address = FocusNode(), _name = FocusNode();
  final _fundSource = FocusNode();
  final _fundDestination = FocusNode();

  final bool isRejected;
  final BatchPendingsCw batch;
  final String operationDescription;
  final password = TextEditingController(text: '');
  final reasonRejection = TextEditingController(text: '');
  String _token = '';
  List<AuthorizeResponse> bathAuthorize = new List<AuthorizeResponse>();
  AuthorizeBatch dto = new AuthorizeBatch();
  _SemapaViewState(this.isRejected, this.batch, this.operationDescription,
      this.animationController);

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

  List<Company> _companies = Company.getCompanies();
  List<Currency> _currencies = Currency.getCurrencies();
  List<FavoriteEpsas> _favorites = FavoriteEpsas.getFav();
  List<PaymentType> _paymentTypes = PaymentType.getPayType();

  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  List<DropdownMenuItem<Currency>> _dropdownItemsCurrency;
  List<DropdownMenuItem<FavoriteEpsas>> _dropdownItemsFav;
  List<DropdownMenuItem<PaymentType>> _dropdownItemsPayTypes;

  Company _selectedCompany;
  Currency _selectedCurrency;
  FavoriteEpsas _selectedFav;
  PaymentType _selectedPaymentType;

  List<DropdownMenuItem<Currency>> buildDropdownCurrencies(List currencies) {
    List<DropdownMenuItem<Currency>> items = List();
    for (Currency currency in currencies) {
      items.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency.description),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<FavoriteEpsas>> buildDropdownItemsFav(List favorites) {
    List<DropdownMenuItem<FavoriteEpsas>> items = List();
    for (FavoriteEpsas fav in favorites) {
      items.add(
        DropdownMenuItem(
          value: fav,
          child: Text(fav.description),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<PaymentType>> buildDropdownItemsPaymentType(
      List paymentTypes) {
    List<DropdownMenuItem<PaymentType>> items = List();
    for (PaymentType pay in paymentTypes) {
      items.add(
        DropdownMenuItem(
          value: pay,
          child: Text(pay.description),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  onChangeDropdownItemCur(Currency selectedCurrency) {
    setState(() {
      _selectedCurrency = selectedCurrency;
    });
  }

  onChangeDropdownItemFavorites(FavoriteEpsas selectedFav) {
    setState(() {
      _selectedFav = selectedFav;
    });
  }

  onChangeDropdownItemPaymentTypes(PaymentType selectedPaymentType) {
    setState(() {
      _selectedPaymentType = selectedPaymentType;
    });
  }

  @override
  void initState() {
    this._getToken();
    _dropdownItemsCurrency = buildDropdownCurrencies(_currencies);
    _selectedCurrency = _dropdownItemsCurrency[0].value;
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    _dropdownItemsFav = buildDropdownItemsFav(_favorites);
    _selectedFav = _dropdownItemsFav[0].value;
    _dropdownItemsPayTypes = buildDropdownItemsPaymentType(_paymentTypes);
    _selectedPaymentType = _dropdownItemsPayTypes[0].value;
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
            //getAppBarUI(),
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 16, top: 8),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: HexColor('f57328'), //Color(0xFFf57328),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
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
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 16, top: 8),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors
                            .grey, //HotelAppTheme.buildLightTheme().primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget allAccommodationUI(bool isRejected) {
    UtilsViews utils = new UtilsViews(context);
    int count = 5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    TitleView(
                      titleTxt: 'Seleccione Cuenta Origen',
                      subTxt: '',
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: widget.animationController,
                              curve: Interval((1 / count) * 0, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: widget.animationController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    utils.getDropdown(_selectedCompany, _dropdownMenuItems,
                        onChangeDropdownItem, Icons.credit_card),
                    SizedBox(
                      height: 20.0,
                    ),
                    utils.getTextTransaction('Cuenta', _selectedCompany.name),
                    utils.getTextTransaction(
                        'Titular', _selectedCompany.titular),
                    utils.getTextTransaction('Saldo Disponible',
                        '${_selectedCompany.balance} Bolivianos'),
                    SizedBox(
                      height: 25.0,
                    ),
                    TitleView(
                      titleTxt: 'Ingrese datos de servicio',
                      subTxt: '',
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: widget.animationController,
                              curve: Interval((1 / count) * 0, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: widget.animationController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    utils.getDropdown(_selectedFav, _dropdownItemsFav,
                        onChangeDropdownItemFavorites, Icons.backup),
                    SizedBox(
                      height: 20.0,
                    ),
                    utils.getTextTransaction(
                        'Nombre Favorito', _selectedFav.description),
                    utils.getDropdown(
                        _selectedPaymentType,
                        _dropdownItemsPayTypes,
                        onChangeDropdownItemPaymentTypes,
                        Icons.search),
                    utils.getInput(_fundSource, _selectedPaymentType.description),
                    SizedBox(
                      height: 20.0,
                    ),
                    TitleView(
                      titleTxt: 'Ingrese el Importe',
                      subTxt: '',
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: widget.animationController,
                              curve: Interval((1 / count) * 0, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: widget.animationController,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 8),
                            child: Container(
                              child: FocusWidget(
                                focusNode: _address,
                                child: TextField(
                                  focusNode: _address,
                                  maxLength: 15,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [ThousandsFormatter()],
                                  decoration: InputDecoration(
                                    hintText: 'Monto',
                                    labelText: 'Monto',
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: HexColor('FF8000')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                //Icon(Icons.accessibility),
                                /*SvgPicture.asset(
                                    "assets/icons/maps-and-flags.svg"),*/
                                SizedBox(width: 1),
                                Expanded(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    icon: Icon(Icons.arrow_drop_down),
                                    /*icon: SvgPicture.asset(
                                        "assets/icons/dropdown.svg"),*/
                                    value: _selectedCurrency,
                                    items: _dropdownItemsCurrency,
                                    onChanged: onChangeDropdownItemCur,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TitleView(
                      titleTxt: 'Seleccione autorizadores',
                      subTxt: '',
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: widget.animationController,
                              curve: Interval((1 / count) * 0, 1.0,
                                  curve: Curves.fastOutSlowIn))),
                      animationController: widget.animationController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    popularFilter(),
                    utils.getInput(_fundSource,
                        'Enviar comprobante al procesarse', 200, 3),
                  ],
                ),
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
        // Padding(
        //   padding:
        //       const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        //   child: Text(
        //     'Estados de operacion',
        //     textAlign: TextAlign.left,
        //     style: TextStyle(
        //         color: Colors.grey,
        //         fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
        //         fontWeight: FontWeight.normal),
        //   ),
        // ),
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
    const int columnCount = 1;
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
                                ? Colors.orange[900]
                                : Colors.grey.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '${date.titleTxt} - ',
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            date.limit.toString(),
                          )
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

class Company {
  int id;
  String name;
  String titular;
  double balance;

  Company(this.id, this.name, this.titular, this.balance);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, '201-500911126-3-79', 'Armando Esteban Quito', 2000),
      Company(2, '201-500911126-3-78', 'Zoyla Cerda', 2000),
      Company(3, '201-500911126-2-79', 'Armando Paredes', 2000),
      Company(4, '201-500911126-2-80', 'Julio Berne', 2000),
      Company(5, '201-500911126-4-51', 'Leon S. Kennedy', 2000),
    ];
  }
}

class Currency {
  String code;
  String description;

  Currency(this.code, this.description);

  static List<Currency> getCurrencies() {
    return <Currency>[
      Currency('BOL', 'Bolivianos'),
      Currency('USD', 'Dolares'),
    ];
  }
}

class FavoriteEpsas {
  String code;
  String description;

  FavoriteEpsas(this.code, this.description);

  static List<FavoriteEpsas> getFav() {
    return <FavoriteEpsas>[
      FavoriteEpsas('1', 'Fav 1 Semapa'),
      FavoriteEpsas('2', 'Fav 2 Semapa'),
    ];
  }
}

class PaymentType {
  String code;
  String description;

  PaymentType(this.code, this.description);

  static List<PaymentType> getPayType() {
    return <PaymentType>[
      PaymentType('BOL', 'Recorrido'),
      PaymentType('USD', 'Cuenta'),
    ];
  }
}
