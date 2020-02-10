import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
     TabIconData(
      imagePath: 'assets/images/companyDates2.png',
      selectedImagePath: 'assets/images/companyDates.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/accountsTab.png',
      selectedImagePath: 'assets/images/accountsTabOr.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/batches2.png',
      selectedImagePath: 'assets/images/batches.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/IconNewAcc2.png',
      selectedImagePath: 'assets/images/Tracking.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
    /*TabIconData(
      imagePath: 'assets/images/His2.png',
      selectedImagePath: 'assets/images/His.png',
      index: 4,
      isSelected: false,
      animationController: null,
    ),*/
  ];
}
