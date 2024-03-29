import 'dart:convert';

import 'package:cw_app/Services/API.dart';
import 'package:cw_app/Views/Models/company_information.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/meals_list_data.dart';
import 'package:cw_app/Views/information/dates_company.dart';
import 'package:cw_app/Views/information/users_dates.dart';
import 'package:cw_app/Views/my_diary/meals_list_view.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:cw_app/Views/ui_view/title_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Information extends StatefulWidget {
  const Information({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<Information>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  String _token = '';
  CompanyInformation companyDates = new CompanyInformation();
  List<MealsListData> roles = new List<MealsListData>();

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  bool _isFetching = false;

  Future<void> _getToken() async {
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');

    if (!mounted) return;

    setState(() {
      _token = value;
      _isFetching = true;
      _getInformation();
    });
  }

  Future<void> _getInformation() {
    API.getInformation(_token).then((dynamic response) {
      setState(() {
        dynamic aux = response.body;
        Map<String, dynamic> aux2 = jsonDecode(aux);
        dynamic isOk = aux2["isOk"];
        companyDates = CompanyInformation.fromJson(aux2['body']);
        addAllListData();
        _isFetching = false;
      });
    });
  }

  Widget viewCharge() {
    return _isFetching
        ? Positioned.fill(
            child: Container(
            child: CupertinoActivityIndicator(
              radius: 15,
              animating: true,
            ),
          ))
        : Container();
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
    _getToken();
    super.initState();
  }

  void addAllListData() {
    const int count = 5;

    listViews.add(
      TitleView(
        titleTxt: 'Datos de Compañia',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
    listViews.add(
      DatesCompany(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          companyName: this.companyDates.companyName,
          companyDocument: this.companyDates.companyDocument,
          companyLimit: this.companyDates.companyLimit),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Datos de Usuario y Roles',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      UsersDates(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          userName: this.companyDates.userName,
          userDocument: this.companyDates.userDocument,
          userLimit: this.companyDates.userLimit),
    );

    listViews.add(
      MealsListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
        roles: getRoles(),
      ),
    );
  }

  List<MealsListData> getRoles() {
    this.roles = new List<MealsListData>();
    var role = new MealsListData();
    if (this.companyDates.isConsultant) {
      role = new MealsListData();
      role.imagePath = 'assets/images/consulter2.png';
      role.titleTxt = 'Consultor';
      role.startColor = '#014B8E';
      role.endColor = '#014B8E';
      this.roles.add(role);
    }
    if (this.companyDates.isPreparer) {
      role = new MealsListData();
      role.imagePath = 'assets/images/initiator.png';
      role.titleTxt = 'Iniciador';
      role.startColor = '#014B8E';
      role.endColor = '#014B8E';
      this.roles.add(role);
    }
    if (this.companyDates.isController) {
      role = new MealsListData();
      role.imagePath = 'assets/images/controller3.png';
      role.titleTxt = 'Controlador';
      role.startColor = '#014B8E';
      role.endColor = '#014B8E';
      this.roles.add(role);
    }
    if (this.companyDates.isAuthorizer) {
      role = new MealsListData();
      role.imagePath = 'assets/images/autorizer.png';
      role.titleTxt = 'Autorizador';
      role.startColor = '#014B8E';
      role.endColor = '#014B8E';
      this.roles.add(role);
    }
    return this.roles;
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
        appBar: AppBar(
          title: Text('Informacion'),
          backgroundColor: HexColor('014B8E'),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            //getAppBarUI(),
            viewCharge(),
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
                  0,
              bottom: 0 + MediaQuery.of(context).padding.bottom,
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
                                  'Información',
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
