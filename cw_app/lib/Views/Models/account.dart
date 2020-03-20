class Account {
  int id;
  String formattedNumber;
  String number;
  String currency;
  String owner;
  double inProgressOperations;
  String application;
  String type;
  double withholding;
  double averageBalance;
  double availableBalance;
  double accountingBalance;
  double position;
  double overdraftBalance;
  double overdraftAmount;
  String currencyDescription;
  String applicationDescription;
  String documentAccount;

  Account() {
    this.id = 0;
    this.formattedNumber = '';
    this.number = '';
    this.currency = '';
    this.owner = '';
    this.inProgressOperations = 0;
    this.application = '';
    this.type = '';
    this.withholding = 0;
    this.averageBalance = 0;
    this.availableBalance = 0;
    this.accountingBalance = 0;
    this.position = 0;
    this.overdraftBalance = 0;
    this.overdraftAmount = 0;
    this.currencyDescription = '';
    this.applicationDescription = '';
    this.documentAccount = '';
  }

  Account.fromJson(Map json)
      : id = json['id'],
        formattedNumber = json['formattedNumber'],
        number = json['number'],
        currency = json['currency'],
        owner = json['owner'],
        inProgressOperations = json['inProgressOperations'],
        application = json['application'],
        type = json['type'],
        withholding = json['withholding'],
        averageBalance = json['averageBalance'],
        availableBalance = json['availableBalance'],
        accountingBalance = json['accountingBalance'],
        position = json['position'],
        overdraftBalance = json['overdraftBalance'],
        overdraftAmount = json['overdraftAmount'],
        currencyDescription = json['currencyDescription'],
        applicationDescription = json['applicationDescription'],
        documentAccount = json['documentAccount'];

  dynamic toJson() {
    return { 
      'id': id,
      'formattedNumber': formattedNumber,
      'number': number,
      'currency': currency,
      'owner': owner,
      'inProgressOperations': inProgressOperations,
      'application': application,
      'type': type,
      'withholding': withholding,
      'averageBalance': averageBalance,
      'availableBalance': availableBalance,
      'accountingBalance': accountingBalance,
      'position': position,
      'overdraftBalance': overdraftBalance,
      'overdraftAmount': overdraftAmount,
      'currencyDescription': currencyDescription,
      'applicationDescription': applicationDescription,
      'documentAccount': documentAccount
    };
  }
}
