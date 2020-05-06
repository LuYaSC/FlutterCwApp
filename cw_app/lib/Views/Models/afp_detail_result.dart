class AfpDetailResult {
  int processBatchId;
  String sourceAccount;
  double amount;
  String currency;
  String serviceType;
  String afp;
  String concept;
  String fundSource;
  String fundDestination;

  AfpDetailResult() {
    this.processBatchId = 0;
    this.sourceAccount = '';
    this.amount = 0;
    this.currency = '';
    this.serviceType = '';
    this.afp = '';
    this.concept = '';
    this.fundSource = '';
    this.fundDestination = '';
  }

  AfpDetailResult.fromJson(Map json)
      : processBatchId = json['processBatchId'],
        sourceAccount = json['sourceAccount'],
        amount = json['amount'],
        currency = json['currency'],
        serviceType = json['serviceType'],
        afp = json['afp'],
        concept = json['concept'],
        fundSource = json['fundSource'],
        fundDestination = json['fundDestination'];

  dynamic toJson() {
    return {
      'processBatchId': processBatchId,
      'sourceAccount': sourceAccount,
      'amount': amount,
      'currency': currency,
      'serviceType': serviceType,
      'afp': afp,
      'concept': concept,
      'fundSource': fundSource,
      'fundDestination': fundDestination,
    };
  }
}
