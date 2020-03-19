class BatchPendings {
  String id;
  String operationType;
  String operationTypeId;
  String account;
  String accountId;
  String isAuthorizerControl;
  String amount;
  String currency;
  String creationDate;
  String isOperationScheduled;
  String operationScheduledDate;
  String beneficiary;

  BatchPendings(
      String id,
      String operationType,
      String operationTypeId,
      String account,
      String accountId,
      String isAuthorizerControl,
      String amount,
      String currency,
      String creationDate,
      String isOperationScheduled,
      String operationScheduledDate,
      String beneficiary) {
    this.id = id;
    this.operationType = operationType;
    this.operationTypeId = operationTypeId;
    this.account = currency;
    this.accountId = accountId;
    this.isAuthorizerControl = isAuthorizerControl;
    this.amount = amount;
    this.currency = currency;
    this.creationDate = creationDate;
    this.isOperationScheduled = isOperationScheduled;
    this.operationScheduledDate = operationScheduledDate;
    this.beneficiary = beneficiary;
  }

  BatchPendings.fromJson(Map json)
      : id = json['id'],
        operationType = json['operationType'],
        operationTypeId = json['operationTypeId'],
        account = json['account'],
        accountId = json['accountId'],
        isAuthorizerControl = json['isAuthorizerControl'],
        amount = json['amount'],
        currency = json['currency'],
        creationDate = json['creationDate'],
        isOperationScheduled = json['isOperationScheduled'],
        operationScheduledDate = json['operationScheduledDate'],
        beneficiary = json['beneficiary'];
        

  dynamic toJson() {
    return {
      'id': id,
      'operationType': operationType,
      'operationTypeId': operationTypeId,
      'account': account,
      'accountId': accountId,
      'isAuthorizerControl': isAuthorizerControl,
      'amount': amount,
      'currency': currency,
      'creationDate': creationDate,
      'isOperationScheduled': isOperationScheduled,
      'operationScheduledDate': operationScheduledDate,
      'beneficiary': beneficiary,
    };
  }
}
