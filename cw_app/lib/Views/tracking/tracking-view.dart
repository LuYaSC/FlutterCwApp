import 'dart:convert';

import 'package:cw_app/Services/API.dart';
import 'package:cw_app/Views/Models/tracking_batch.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/tracking/filters_screen_tracking.dart';
import 'package:cw_app/Views/tracking/list-batches-tracking.dart';
import 'package:cw_app/Views/tracking/screen_donwloads.dart';
import 'package:cw_app/Views/tracking/total-batches-tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TrackingView extends StatefulWidget {
  const TrackingView({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<TrackingView>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  String _token = '';
  List<TrackingBatch> list = new List<TrackingBatch>();

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  Future<void> _getToken() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');

    if (!mounted) return;

    setState(() {
      _token = value;
      _getMovements();
    });
  }

  Future<void> _getMovements() {
    API.getTrackingBatches(_token).then((dynamic response) {
      setState(() {
        dynamic aux = response.body;
        Map<String, dynamic> aux2 = jsonDecode(aux);
        dynamic isOk = aux2["isOk"];
        var listResponse = aux2['body'] as List;
        list = listResponse
            .map((model) => TrackingBatch.fromJson(model))
            .toList();
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
    _getToken();
  }

  void addAllListData() {
    const int count = 9;
    listViews.add(
      TotalBatchesTracking(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 8, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController, 
          totalOperation: list.length,),
    );

    for (int i = 0; i < list.length; i++) {
      bool rotation = false;
      if (i % 2 == 0) {
        rotation = true;
      }
      listViews.add(
        ListBatchesTracking(
          rotation: rotation,
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 1, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          list: this.list[i],
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
                                  'Seguimiento',
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
                                            ScreenDonwloads(),
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
                                            Icons.file_download,
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
                                            FiltersScreenTracking(),
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
                            /*SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(
                                  child: Icon(
                                    Icons.filter_list,
                                    color: Colors
                                        .orange[900], // FintnessAppTheme.grey,
                                  ),
                                ),
                              ),
                            ),*/
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
