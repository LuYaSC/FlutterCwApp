import 'dart:convert';

import 'package:cw_app/Services/API.dart';
import 'package:cw_app/Views/Models/batch_pendings.dart';
import 'package:cw_app/Views/Models/filters_screen.dart';
import 'package:cw_app/Views/Models/total_batches_pending.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/tracking/screen_accepted.dart';
import 'package:cw_app/Views/ui_view/glass_view.dart';
import 'package:cw_app/Views/ui_view/mediterranesn_diet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  String _token = '';
  double topBarOpacity = 0.0;
  TotalBatchesPending list = new TotalBatchesPending();
  List<BatchPendings> totalListPending = new List<BatchPendings>();
  List<BatchPendings> batchesListControlled = new List<BatchPendings>();
  List<BatchPendings> batchesListAuthorized = new List<BatchPendings>();
  String operationDescription = '';

  Future<void> _getToken() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');

    if (!mounted) return;

    setState(() {
      _token = value;
      _getPendings();
    });
  }

  Future<void> _getPendings() {
    API.getPendings(_token).then((dynamic response) {
      setState(() {
        dynamic aux = response.body;
        Map<String, dynamic> aux2 = jsonDecode(aux);
        dynamic isOk = aux2["isOk"];
        var listControl = aux2['body']['batchesToControl'] as List;
        var listAuthorize = aux2['body']['batchesToAuthorize'] as List;
        batchesListControlled = listControl.map((model) => BatchPendings.fromJson(model)).toList();
        batchesListControlled.forEach((x) => x.isBatchControl = true);
        batchesListAuthorized = listAuthorize.map((model) => BatchPendings.fromJson(model)).toList();
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
    //addAllListData();

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
    this._getToken();
    super.initState();
  }

  void addAllListData() {
    const int count = 9;
    listViews.add(
      GlassView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 8, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          batchforAuthorize: batchesListAuthorized.length.toString(),
          batchforControl: batchesListControlled.length.toString()),
    );

    for (int i = 0; i < this.totalListPending.length; i++) {
      listViews.add(
        MediterranesnDietView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 1, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          list: this.totalListPending[i],
        ),
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
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
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
                                  'Pendientes',
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
                                            ScreenAccepted(),
                                        fullscreenDialog: true),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: <Widget>[
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
