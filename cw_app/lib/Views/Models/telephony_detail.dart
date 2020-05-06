class TelephonyDetail {
  String city;
  String concept;
  int processBatchId;
  String accountNumber;
  double amount;
  String currency;

  TelephonyDetail() {
    this.city = '';
    this.concept = '';
    this.processBatchId = 0;
    this.accountNumber = '';
    this.amount = 0;
    this.currency = '';
  }

  TelephonyDetail.fromJson(Map json)
      : city = json['city'],
        concept = json['concept'],
        processBatchId = json['processBatchId'],
        accountNumber = json['accountNumber'],
        amount = json['amount'],
        currency = json['currency'];

  dynamic toJson() {
    return {
      'city': city,
      'concept': concept,
      'processBatchId': processBatchId,
      'accountNumber': accountNumber,
      'amount': amount,
      'currency': currency
    };
  }
}
