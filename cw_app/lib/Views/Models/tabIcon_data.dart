import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.name ='',
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  String name;
  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
     TabIconData(
      imagePath: 'assets/images/companyDates2.png',
      selectedImagePath: 'assets/images/companyDatesnewor.png',
      index: 0,
      isSelected: false,
      name: 'Informacion',
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/accountsTab.png',
      selectedImagePath: 'assets/images/accountsTabOr.png',
      index: 1,
      isSelected: false,
      name: 'Cuentas',
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/batches2.png',
      selectedImagePath: 'assets/images/batches4newor.png',
      index: 2,
      isSelected: true,
      name: 'Pendientes',
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/IconNewAcc2.png',
      selectedImagePath: 'assets/images/accountsTabnewor.png',
      index: 3,
      isSelected: false,
      name: 'Seguimiento',
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
