class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.numberAccount = '',
    this.currencyImage = '',
    this.titular = "",
    this.balance = 180,
    this.currency = 'Bs',
    this.accountType = 'Cuenta de ahorro'
  });

  String imagePath;
  String currencyImage;
  String numberAccount;
  String titular;
  double balance;
  String currency;
  String accountType;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/images/fondoCta.jpg',
      currencyImage: 'assets/images/BOL.png',
      numberAccount: '201-50173212-3-94',
      titular: 'Sillerico Neganez Rodolfo Andres',
      balance: 2000.00,
      currency: 'Bs',
    ),
    HotelListData(
      imagePath: 'assets/images/fondoCta.jpg',
      currencyImage: 'assets/images/USD.png',
      numberAccount: '201-50738949-2-44',
      titular: 'Hilaquita Mamani Remberto',
      balance: 1001.27,
      currency: '\$us',
    ),
    HotelListData(
      imagePath: 'assets/images/fondoCta.jpg',
      currencyImage: 'assets/images/BOL.png',
      numberAccount: '201-50173212-3-94',
      titular: 'Sillerico Neganez Rodolfo Andres',
      balance: 2000.00,
      currency: 'Bs',
    ),
    HotelListData(
      imagePath: 'assets/images/fondoCta.jpg',
      currencyImage: 'assets/images/USD.png',
      numberAccount: '201-50738949-2-44',
      titular: 'Hilaquita Mamani Remberto',
      balance: 1001.27,
      currency: '\$us',
    ),
    HotelListData(
      imagePath: 'assets/images/fondoCta.jpg',
      currencyImage: 'assets/images/BOL.png',
      numberAccount: '201-50173212-3-94',
      titular: 'Sillerico Neganez Rodolfo Andres',
      balance: 2000.00,
      currency: 'Bs',
    ),
    HotelListData(
      imagePath: 'assets/images/fondoCta.jpg',
      currencyImage: 'assets/images/USD.png',
      numberAccount: '201-50738949-2-44',
      titular: 'Hilaquita Mamani Remberto',
      balance: 1001.27,
      currency: '\$us',
    )
    /*HotelListData(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),*/
  ];
}
