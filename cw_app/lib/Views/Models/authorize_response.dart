class AuthorizeResponse {
  int id;
  String status;
  String operation;
  String sourceAccount;
  String amount;
  String currency;
  String result;
  int operationTypeId;

  AuthorizeResponse() {
    this.id = 0;
    this.status = '';
    this.operation = '';
    this.sourceAccount = '';
    this.amount = '';
    this.currency = '';
    this.operationTypeId = 0;
  }

  AuthorizeResponse.fromJson(Map json)
      : id = json['id'],
        status = json['status'],
        operation = json['operation'],
        sourceAccount = json['sourceAccount'],
        amount = json['amount'],
        currency = json['currency'],
        result = json['result'],
        operationTypeId =json['operationTypeId'];

  dynamic toJson() {
    return {
      'id': id,
      'status': status,
      'operation': operation,
      'sourceAccount': sourceAccount,
      'amount': amount,
      'currency': currency,
      'operationTypeId': operationTypeId,
    };
  }
}
