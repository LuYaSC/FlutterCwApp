import 'package:cw_app/Views/bottom_navigation_view/bottom_bar_view.dart';
import 'package:cw_app/Views/information/information.dart';
import 'package:cw_app/Views/models/tabIcon_data.dart';
import 'package:cw_app/Views/my_diary/pending_batches_screen.dart';
import 'package:cw_app/Views/tracking/tracking-view.dart';
import 'package:cw_app/Views/traning/training_screen.dart';
import 'package:flutter/material.dart';
import 'fintness_app_theme.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FintnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[2].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = PendingBatchesScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            switch (index) {
              case 0:
              animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = Information(animationController: animationController);
                  });
                });
                break;
              case 1:
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = TrainingScreen(animationController: animationController);
                  });
                });
                break;
              case 2:
               animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = PendingBatchesScreen(animationController: animationController);
                  });
                });
                break;
              case 3:
              animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = TrackingView(animationController: animationController);
                  });
                });
                break;
                default:
                 animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = PendingBatchesScreen(animationController: animationController);
                  });
                });
                break;
            }
          },
        ),
      ],
    );
  }
}
