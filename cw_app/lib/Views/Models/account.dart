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

  Account(
      int id,
      String formattedNumber,
      String number,
      String currency,
      String owner,
      double inProgressOperations,
      String application,
      String type,
      double withholding,
      double averageBalance,
      double availableBalance,
      double accountingBalance,
      double position,
      double overdraftBalance,
      double overdraftAmount,
      String currencyDescription,
      String applicationDescription,
      String documentAccount) {
    this.id = id;
    this.formattedNumber = formattedNumber;
    this.number = number;
    this.currency = currency;
    this.owner = owner;
    this.inProgressOperations = inProgressOperations;
    this.application = application;
    this.type = type;
    this.withholding = withholding;
    this.averageBalance = averageBalance;
    this.availableBalance = availableBalance;
    this.accountingBalance = accountingBalance;
    this.position = position;
    this.overdraftBalance = overdraftBalance;
    this.overdraftAmount = overdraftAmount;
    this.currencyDescription = currencyDescription;
    this.applicationDescription = applicationDescription;
    this.documentAccount = documentAccount;
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

  Map toJson() {
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
