import 'package:cw_app/Views/Models/hexColor.dart';
import 'package:cw_app/Views/Models/meals_list_data.dart';
import 'package:cw_app/Views/themes/fintness_app_theme.dart';
import 'package:flutter/material.dart';

class MealsListView extends StatefulWidget {
  const MealsListView(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.roles})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<MealsListData> roles;

  @override
  _MealsListViewState createState() => _MealsListViewState(this.roles);
}

class _MealsListViewState extends State<MealsListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<MealsListData> roles;

  _MealsListViewState(List<MealsListData> roles) {
    this.roles = roles;
  }
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: 90,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: roles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count = roles.length > 10 ? 10 : roles.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return MealsView(
                    mealsListData: roles[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView(
      {Key key, this.mealsListData, this.animationController, this.animation})
      : super(key: key);

  final MealsListData mealsListData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                50 * (1.0 - animation.value), 0.0, 0.0),
            child: SizedBox(
              width: 100,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60, left: 8, right: 0, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor(mealsListData.endColor)
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor(mealsListData.startColor),
                            HexColor(mealsListData.endColor),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(5.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 16, right: 16, bottom: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              mealsListData.titleTxt,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: FintnessAppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                letterSpacing: 0.2,
                                color: FintnessAppTheme.white,
                              ),
                            ),
                            /*Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      mealsListData.meals.join('\n'),
                                      style: TextStyle(
                                        fontFamily: FintnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        letterSpacing: 0.2,
                                        color: FintnessAppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),*/
                            /*mealsListData.kacl != 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        mealsListData.kacl.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FintnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                          letterSpacing: 0.2,
                                          color: FintnessAppTheme.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 3),
                                        child: Text(
                                          'kcal',
                                          style: TextStyle(
                                            fontFamily:
                                                FintnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            letterSpacing: 0.2,
                                            color: FintnessAppTheme.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: FintnessAppTheme.nearlyWhite,
                                      shape: BoxShape.circle,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: FintnessAppTheme.nearlyBlack
                                                .withOpacity(0.4),
                                            offset: Offset(8.0, 8.0),
                                            blurRadius: 8.0),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.add,
                                        color: HexColor(mealsListData.endColor),
                                        size: 24,
                                      ),
                                    ),
                                  ),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: FintnessAppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 8,
                    right: 37,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(mealsListData.imagePath),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
