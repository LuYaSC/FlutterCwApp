class AbroadDetailGPI {
  String message;
  String receptionSequence;
  String emissionDate;
  String emissionHour;
  String receptionDate;
  String receptionHour;
  String status;
  String sender;
  String countryReceiver;
  String cityReceiver;
  String bankReceiver;
  String reference;
  String relatedReference;
  String date;
  String codes;
  String codeDescription;
  String countryBIC;
  String cityBIC;
  String bankBIC;
  String crediCurrency;
  double creditAmount;
  String expenses;
  String currencyTCOne;
  String currencyTCTwo;
  double amountTC;
  String currencyAmountOne;
  double amountOne;
  String currencyAmountTwo;
  double amountTwo;
  String currencyAmountThree;
  double amountThree;
  String currencyAmountFour;
  double amountFour;
  String currencyAmountFive;
  double amountFive;
  String currencyAmountSix;
  double amountSix;
  String currencyAmountSeven;
  double amountSeven;
  String currencyAmountEight;
  double amountEight;
  String currencyAmountNine;
  double amountNine;
  String currencyAmountTen;
  double amountTen;
  String duplicateBroadcast;
  String duplicateMessage;
  String originalSequence;
  String registerDate;

  AbroadDetailGPI() {
    this.status = '';
    this.sender = '';
    this.countryReceiver = '';
    this.cityReceiver = '';
    this.bankReceiver = '';
    this.reference = '';
    this.relatedReference = '';
    this.date = '';
    this.codes = '';
    this.codeDescription = '';
    this.countryBIC = '';
    this.cityBIC = '';
    this.bankBIC = '';
    this.crediCurrency = '';
    this.creditAmount = 0;
    this.expenses = '';
    this.currencyTCOne = '';
    this.currencyTCTwo = '';
    this.amountTC = 0;
    this.currencyAmountOne = '';
    this.amountOne = 0;
    this.currencyAmountTwo = '';
    this.amountTwo = 0;
    this.currencyAmountThree = '';
    this.amountThree = 0;
    this.currencyAmountFour = '';
    this.amountFour = 0;
    this.currencyAmountFive = '';
    this.amountFive = 0;
    this.currencyAmountSix = '';
    this.amountSix = 0;
    this.currencyAmountSeven = '';
    this.amountSeven = 0;
    this.currencyAmountEight = '';
    this.amountEight = 0;
    this.currencyAmountNine = '';
    this.amountNine = 0;
    this.currencyAmountTen = '';
    this.amountTen = 0;
    this.duplicateBroadcast = '';
    this.duplicateMessage = '';
    this.originalSequence = '';
    this.registerDate = '';
  }

  AbroadDetailGPI.fromJson(Map json)
      : message = json['message'],
        receptionSequence = json['receptionSequence'],
        emissionDate = json['emissionDate'],
        emissionHour = json['emissionHour'],
        receptionDate = json['receptionDate'],
        receptionHour = json['receptionHour'],
        status = json['status'],
        sender = json['sender'],
        countryReceiver = json['countryReceiver'],
        cityReceiver = json['cityReceiver'],
        bankReceiver = json['bankReceiver'],
        reference = json['reference'],
        relatedReference = json['relatedReference'],
        date = json['date'],
        codes = json['codes'],
        codeDescription = json['codeDescription'],
        countryBIC = json['countryBIC'],
        cityBIC = json['cityBIC'],
        bankBIC = json['bankBIC'],
        crediCurrency = json['crediCurrency'],
        creditAmount = json['creditAmount'],
        expenses = json['expenses'],
        currencyTCOne = json['currencyTCOne'],
        currencyTCTwo = json['currencyTCTwo'],
        amountTC = json['amountTC'],
        currencyAmountOne = json['currencyAmountOne'],
        amountOne = json['amountOne'],
        currencyAmountTwo = json['currencyAmountTwo'],
        amountTwo = json['amountTwo'],
        currencyAmountThree = json['currencyAmountThree'],
        amountThree = json['amountThree'],
        currencyAmountFour = json['currencyAmountFour'],
        amountFour = json['amountFour'],
        currencyAmountFive = json['currencyAmountFive'],
        amountFive = json['amountFive'],
        currencyAmountSix = json['currencyAmountSix'],
        amountSix = json['amountSix'],
        currencyAmountSeven = json['currencyAmountSeven'],
        amountSeven = json['amountSeven'],
        currencyAmountEight = json['currencyAmountEight'],
        amountEight = json['amountEight'],
        currencyAmountNine = json['currencyAmountNine'],
        amountNine = json['amountNine'],
        currencyAmountTen = json['currencyAmountTen'],
        amountTen = json['amountTen'],
        duplicateBroadcast = json['duplicateBroadcast'],
        duplicateMessage = json['duplicateMessage'],
        originalSequence = json['originalSequence'],
        registerDate = json['registerDate'];

  dynamic toJson() {
    return {
      'message': message,
      'receptionSequence': receptionSequence,
      'emissionDate': emissionDate,
      'emissionHour': emissionHour,
      'receptionDate': receptionDate,
      'receptionHour': receptionHour,
      'status': status,
      'sender': sender,
      'countryReceiver': countryReceiver,
      'cityReceiver': cityReceiver,
      'bankReceiver': bankReceiver,
      'reference': reference,
      'relatedReference': relatedReference,
      'date': date,
      'codes': codes,
      'codeDescription': codeDescription,
      'countryBIC': countryBIC,
      'cityBIC': cityBIC,
      'bankBIC': bankBIC,
      'crediCurrency': crediCurrency,
      'creditAmount': creditAmount,
      'expenses': expenses,
      'currencyTCOne': currencyTCOne,
      'currencyTCTwo': currencyTCTwo,
      'amountTC': amountTC,
      'currencyAmountOne': currencyAmountOne,
      'amountOne': amountOne,
      'currencyAmountTwo': currencyAmountTwo,
      'amountTwo': amountTwo,
      'currencyAmountThree': currencyAmountThree,
      'amountThree': amountThree,
      'currencyAmountFour': currencyAmountFour,
      'amountFour': amountFour,
      'currencyAmountFive': currencyAmountFive,
      'amountFive': amountFive,
      'currencyAmountSix': currencyAmountSix,
      'amountSix': amountSix,
      'currencyAmountSeven': currencyAmountSeven,
      'amountSeven': amountSeven,
      'currencyAmountEight': currencyAmountEight,
      'amountEight': amountEight,
      'currencyAmountNine': currencyAmountNine,
      'amountNine': amountNine,
      'currencyAmountTen': currencyAmountTen,
      'amountTen': amountTen,
      'duplicateBroadcast': duplicateBroadcast,
      'duplicateMessage': duplicateMessage,
      'originalSequence': originalSequence,
      'registerDate': registerDate,
    };
  }
}
