class CresagDetail {
  int id;
  String documentNumber;
  String period;
  double amount;
  String name;
  String code;
  String transactionNumber;
  String status;
  String rejectionCause;

  CresagDetail() {
    this.id = 0;
    this.documentNumber = '';
    this.period = '';
    this.amount = 0;
    this.name = '';
    this.code = '';
    this.transactionNumber = '';
    this.status = '';
    this.rejectionCause = '';
  }

  CresagDetail.fromJson(Map json)
      : id = json['id'],
        documentNumber = json['documentNumber'],
        period = json['period'],
        amount = json['amount'],
        name = json['name'],
        code = json['code'],
        transactionNumber = json['transactionNumber'],
        status = json['status'],
        rejectionCause = json['rejectionCause'];

  dynamic toJson() {
    return {
      'id': id,
      'documentNumber': documentNumber,
      'period': period,
      'amount': amount,
      'name': name,
      'code': code,
      'transactionNumber': transactionNumber,
      'status': status,
      'rejectionCause': rejectionCause,
    };
  }
}
