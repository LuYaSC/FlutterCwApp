class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/images/consulter2.png',
      titleTxt: 'Consultor',
      kacl: 525,
      meals: <String>['', '', ''],
      startColor:'#014B8E',
      endColor: '#014B8E',
    ),
    MealsListData(
      imagePath: 'assets/images/initiator.png',
      titleTxt: 'Iniciador',
      kacl: 602,
      meals: <String>['asddddd', 'asdasdas', 'asdasdas'],
      startColor: '#014B8E',
      endColor: '#014B8E',
    ),
    MealsListData(
      imagePath: 'assets/images/controller3.png',
      titleTxt: 'Controlador',
      kacl: 0,
      meals: <String>['', '', ''],
      startColor: '#014B8E',
      endColor: '#014B8E',
    ),
    MealsListData(
      imagePath: 'assets/images/autorizer.png',
      titleTxt: 'Autorizador',
      kacl: 0,
      meals: <String>['', '', ''],
      startColor: '#014B8E',
      endColor: '#014B8E',
    ),
  ];
}
