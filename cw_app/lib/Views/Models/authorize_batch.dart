class AuthorizeBatch {
  List<int> batchIds;
  int operation;
  String rejectionCause;
  String tokenCode;
  String tokenName;
  String password;

  AuthorizeBatch() {
    this.batchIds = new List<int>();
    this.operation = 0;
    this.rejectionCause = '';
    this.tokenCode = '';
    this.tokenName = '';
    this.password = '';
  }

  AuthorizeBatch.fromJson(Map json)
      : batchIds = json['batchIds'],
        operation = json['operation'],
        rejectionCause = json['rejectionCause'],
        tokenCode = json['tokenCode'],
        tokenName = json['tokenName'],
        password = json['password'];

  dynamic toJson() {
    return {
      'batchIds': batchIds,
      'operation': operation,
      'rejectionCause': rejectionCause,
      'tokenCode': tokenCode,
      'tokenName': tokenName,
      'password': password,
    };
  }
}
