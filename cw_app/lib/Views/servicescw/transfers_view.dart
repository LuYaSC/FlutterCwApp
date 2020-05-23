import 'dart:convert';

import 'package:cw_app/Services/API.dart';
import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/filters_screen.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/total_batches_pending.dart';
import 'package:cw_app/Views/servicescw/ach_transfers_view.dart';
import 'package:cw_app/Views/servicescw/own_transfers_view.dart';
import 'package:cw_app/Views/servicescw/third_transfers_view.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/tracking/screen_accepted.dart';
import 'package:cw_app/Views/ui_view/glass_view.dart';
import 'package:cw_app/Views/ui_view/mediterranesn_diet_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TransfersView extends StatefulWidget {
  const TransfersView({this.animationController});

  final AnimationController animationController;
  @override
  _TransfersViewState createState() =>
      _TransfersViewState(this.animationController);
}

class _TransfersViewState extends State<TransfersView>
    with TickerProviderStateMixin {
  _TransfersViewState(AnimationController animationController) {
    this.animationController = animationController;
  }
  Animation<double> topBarAnimation;
  AnimationController animationController;
  List<Widget> listViewsAut = <Widget>[];
  List<Widget> listViewsCtr = <Widget>[];
  final ScrollController scrollControllerAut = ScrollController();
  final ScrollController scrollControllerCtr = ScrollController();
  String _token = '';
  bool _isFetching = false;
  double topBarOpacity = 0.0;
  TotalBatchesPending list = new TotalBatchesPending();
  List<BatchPendingsCw> totalListPending = new List<BatchPendingsCw>();
  List<BatchPendingsCw> batchesListControlled = new List<BatchPendingsCw>();
  List<BatchPendingsCw> batchesListAuthorized = new List<BatchPendingsCw>();
  String operationDescription = '';

  Future<void> _getToken() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');

    if (!mounted) return;

    setState(() {
      _token = value;
      _isFetching = true;
      _getPendings();
    });
  }

  Future<void> _getPendings() {
    API.getPendings(_token).then((dynamic response) {
      setState(() {
        _isFetching = false;
        dynamic aux = response.body;
        Map<String, dynamic> aux2 = jsonDecode(aux);
        dynamic isOk = aux2["isOk"];
        var listControl = aux2['body']['batchesToControl'] as List;
        var listAuthorize = aux2['body']['batchesToAuthorize'] as List;
        batchesListControlled = listControl
            .map((model) => BatchPendingsCw.fromJson(model))
            .toList();
        batchesListControlled.forEach((x) => x.isBatchControl = true);
        batchesListAuthorized = listAuthorize
            .map((model) => BatchPendingsCw.fromJson(model))
            .toList();
        batchesListAuthorized.forEach((x) => x.isBatchControl = false);
        totalListPending = batchesListControlled + batchesListAuthorized;
        addAllListData();
      });
    });
  }

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollControllerAut.addListener(() {
      if (scrollControllerAut.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollControllerAut.offset <= 24 &&
          scrollControllerAut.offset >= 0) {
        if (topBarOpacity != scrollControllerAut.offset / 24) {
          setState(() {
            topBarOpacity = scrollControllerAut.offset / 24;
          });
        }
      } else if (scrollControllerAut.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    scrollControllerCtr.addListener(() {
      if (scrollControllerCtr.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollControllerCtr.offset <= 24 &&
          scrollControllerCtr.offset >= 0) {
        if (topBarOpacity != scrollControllerCtr.offset / 24) {
          setState(() {
            topBarOpacity = scrollControllerCtr.offset / 24;
          });
        }
      } else if (scrollControllerCtr.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    this._getToken();
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  void addAllListData() {
    const int count = 9;

    for (int i = 0; i < this.batchesListAuthorized.length; i++) {
      listViewsAut.add(
        MediterranesnDietView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 1, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          list: this.batchesListAuthorized[i],
        ),
      );
    }
    if (this.batchesListAuthorized.length == 0) {
      listViewsAut.add(
        GlassView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 8, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            message: 'No se encontraron lotes por autorizar'),
      );
    }

    for (int i = 0; i < this.batchesListControlled.length; i++) {
      listViewsCtr.add(
        MediterranesnDietView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 1, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          list: this.batchesListControlled[i],
        ),
      );
    }

    if (this.batchesListControlled.length == 0) {
      listViewsCtr.add(
        GlassView(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval((1 / count) * 8, 1.0,
                        curve: Curves.fastOutSlowIn))),
            animationController: widget.animationController,
            message: 'No se encontraron lotes por autorizar'),
      );
    }
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  String dropdownValue = 'One';
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
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

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isRe = false;
    BatchPendingsCw batch = new BatchPendingsCw();
    String operationDescription = 'Preparar';
    final ktabPages = <Widget>[
      Stack(
        children: <Widget>[
          OwnTransfersView(
              isRe, batch, operationDescription, animationController),
          // getMainListViewUIAuthorizer(),
          // getAppBarUI(false),
          //viewCharge(),
          // SizedBox(
          //   height: MediaQuery.of(context).padding.bottom,
          // )
        ],
      ),
      Stack(
        children: <Widget>[
          ThirdTransfersView(
              isRe, batch, operationDescription, animationController),
          // getMainListViewUIAuthorizer(),
          // getAppBarUI(false),
          //viewCharge(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
      Stack(
        children: <Widget>[
          AchTransfersView(
              isRe, batch, operationDescription, animationController),
          // getMainListViewUIAuthorizer(),
          // getAppBarUI(false),
          //viewCharge(),
          // SizedBox(
          //   height: MediaQuery.of(context).padding.bottom,
          // )
        ],
      ),
    ];
    final kTabs = <Tab>[
      Tab(
        //icon: Icon(Icons.cloud),
        text: 'Propias',
      ),
      Tab(
        //icon: Icon(Icons.cloud),
        text: 'Terceros',
      ),
      Tab(
        //icon: Icon(Icons.cloud),
        text: 'Interbancarias',
      ),
    ];

    return DefaultTabController(
      length: kTabs.length,
      //color: FintnessAppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transferencias'),
          backgroundColor: HexColor('014B8E'),
          bottom: TabBar(tabs: kTabs),
          actions: <Widget>[],
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: ktabPages,
        ), /*Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            viewCharge(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),*/
      ),
    );
  }

  Widget viewCharge() {
    return _isFetching
        ? Positioned.fill(
            child: Container(
            child: CupertinoActivityIndicator(radius: 15),
          ))
        : Container();
  }

  Widget getMainListViewUIAuthorizer() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollControllerAut,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViewsAut.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViewsAut[index];
            },
          );
        }
      },
    );
  }

  Widget getMainListViewUIController() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollControllerCtr,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViewsCtr.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViewsCtr[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI(bool isController) {
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
                                  isController
                                      ? '${this.batchesListControlled.length} Lotes encontrados'
                                      : '${this.batchesListAuthorized.length} Lotes encontrados',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: FintnessAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 8 + 4 - 4 * topBarOpacity,
                                    letterSpacing: 0.8,
                                    color: Colors.orange[900],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.grey.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.push<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            ScreenAccepted(
                                                batches: isController
                                                    ? this.batchesListControlled
                                                    : this
                                                        .batchesListAuthorized),
                                        fullscreenDialog: true),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        isController
                                            ? 'Controlar varios lotes'
                                            : 'Autorizar varios lotes',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.orange[900],
                                          ) // HotelAppTheme.buildLightTheme()
                                          //.primaryColor),
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.grey.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.push<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            FiltersScreen(),
                                        fullscreenDialog: true),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Filtrar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.filter_list,
                                            color: Colors.orange[900],
                                          ) // HotelAppTheme.buildLightTheme()
                                          //.primaryColor),
                                          ),
                                    ],
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
