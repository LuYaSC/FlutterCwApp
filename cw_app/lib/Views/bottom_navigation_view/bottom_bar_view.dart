import 'dart:math' as math;
import 'package:cw_app/Views/Models/batch_pendings_cw.dart';
import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/models/tabIcon_data.dart';
import 'package:cw_app/Views/servicescw/services_electricity_view.dart';
import 'package:cw_app/Views/servicescw/services_water_view.dart';
import 'package:cw_app/Views/servicescw/transfers_view.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconsList;
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: HexColor('014B8E'),
      end: HexColor('fb7437'),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: FintnessAppTheme.white,
                elevation: 20.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                                parent: animationController,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        45.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 52,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList[0],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList[0]);
                                    widget.changeIndex(0);
                                  }),
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList[1],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList[1]);
                                    widget.changeIndex(1);
                                  }),
                            ),
                            SizedBox(
                              width: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animationController,
                                          curve: Curves.fastOutSlowIn))
                                      .value *
                                  45.0,
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList[2],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList[2]);
                                    widget.changeIndex(2);
                                  }),
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList[3],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList[3]);
                                    widget.changeIndex(3);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * 3.0,
                  0.0,
                ),
                child: servicesElectricity(),
              ),
              Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * 2.0,
                  0.0,
                ),
                child: servicesWater(),
              ),
              Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value,
                  0.0,
                ),
                child: transfers(),
              ),
              toggle(),
            ],
          ),
        ),
      ],
    );
  }

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  BatchPendingsCw list = new BatchPendingsCw();

  Widget servicesWater() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: HexColor('014B8E'),
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
        border: new Border.all(width: 4, color: HexColor('014B8E')),
      ),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => ServicesWaterView(
                      animationController: animationController,
                      //key: key,
                    ),
                fullscreenDialog: true),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.opacity,
              color: FintnessAppTheme.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget servicesElectricity() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: HexColor('014B8E'),
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
        border: new Border.all(width: 4, color: HexColor('014B8E')),
      ),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => ServicesElectricityView(
                      animationController: animationController,
                      //key: key,
                    ),
                fullscreenDialog: true),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.power,
              color: FintnessAppTheme.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget transfers() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: HexColor('014B8E'),
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
        border: new Border.all(width: 4, color: HexColor('014B8E')),
      ),
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => TransfersView(
                      animationController: animationController,
                      //key: key,
                    ),
                fullscreenDialog: true),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.monetization_on,
              color: FintnessAppTheme.white,
            ),
          ],
        ),
      ),
    );
  }

  // Widget historicals() {
  //   return Container(
  //     width: 55,
  //     height: 55,
  //     decoration: BoxDecoration(
  //       color: HexColor('014B8E'),
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(100.0),
  //       ),
  //       border: new Border.all(width: 4, color: HexColor('014B8E')),
  //     ),
  //     child: InkWell(
  //       onTap: () {
  //         FocusScope.of(context).requestFocus(FocusNode());
  //         Navigator.push<dynamic>(
  //           context,
  //           MaterialPageRoute<dynamic>(
  //               builder: (BuildContext context) => ServicesView(
  //                     animationController: animationController,
  //                     //key: key,
  //                   ),
  //               fullscreenDialog: true),
  //         );
  //       },
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           Icon(
  //             Icons.assessment,
  //             color: FintnessAppTheme.white,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'btn0',
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconsList.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key key, this.tabIconData, this.removeAllSelect})
      : super(key: key);

  final TabIconData tabIconData;
  final Function removeAllSelect;
  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect();
          widget.tabIconData.animationController.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.tabIconData.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                          parent: widget.tabIconData.animationController,
                          curve:
                              Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Image.asset(widget.tabIconData.isSelected
                      ? widget.tabIconData.selectedImagePath
                      : widget.tabIconData.imagePath),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData.animationController,
                            curve: Interval(0.2, 1.0,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: FintnessAppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData.animationController,
                            curve: Interval(0.5, 0.8,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: FintnessAppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData.animationController,
                            curve: Interval(0.5, 0.6,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: FintnessAppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
