class BatchPendings {
  int id;
  String operationType;
  int operationTypeId;
  String account;
  int accountId;
  bool isAuthorizerControl;
  double amount;
  String currency;
  String creationDate;
  bool isOperationScheduled;
  String operationScheduledDate;
  String beneficiary;
  bool isBatchControl;
  bool isSelected;

  BatchPendings() {
    this.id = 0;
    this.operationType = '';
    this.operationTypeId = 0;
    this.account = '';
    this.accountId = 0;
    this.isAuthorizerControl = false;
    this.amount = 0;
    this.currency = '';
    this.creationDate = '';
    this.isOperationScheduled = false;
    this.operationScheduledDate = '';
    this.beneficiary = '';
    this.isBatchControl = false;
    this.isSelected = false;
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
        beneficiary = json['beneficiary'],
        isSelected = false;

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
