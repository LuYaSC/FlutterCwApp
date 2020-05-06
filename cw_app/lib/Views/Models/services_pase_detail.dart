class ServicesPaseDetail {
  int id;
  String parameters;
  int totalConsumption;
  int totalGeneral;
  bool isBill;
  String queryCode;
  String companyCode;
  String serviceCode;
  String serviceCodeDescription;
  double amount;
  String clientName;
  String companyName;
  String information;
  int quotaNumber;
  String rejectionCause;
  int operationStatusId;
  String nus;
  String accountNumber;
  String address;

  ServicesPaseDetail() {
    this.id = 0;
    this.parameters = '';
    this.totalConsumption = 0;
    this.totalGeneral = 0;
    this.isBill = false;
    this.queryCode = '';
    this.companyCode = '';
    this.serviceCode = '';
    this.serviceCodeDescription = '';
    this.amount = 0;
    this.clientName = '';
    this.companyName = '';
    this.information = '';
    this.quotaNumber = 0;
    this.rejectionCause = '';
    this.operationStatusId = 0;
    this.nus = '';
    this.accountNumber = '';
    this.address = '';
  }

  ServicesPaseDetail.fromJson(Map json)
      : id = json['id'],
        parameters = json['parameters'],
        totalConsumption = json['totalConsumption'],
        totalGeneral = json['totalGeneral'],
        isBill = json['isBill'],
        queryCode = json['queryCode'],
        companyCode = json['companyCode'],
        serviceCode = json['serviceCode'],
        serviceCodeDescription = json['serviceCodeDescription'],
        amount = json['amount'],
        clientName = json['clientName'],
        companyName = json['companyName'],
        information = json['information'],
        quotaNumber = json['quotaNumber'],
        rejectionCause = json['rejectionCause'],
        operationStatusId = json['operationStatusId'],
        nus = json['nus'],
        accountNumber = json['accountNumber'],
        address = json['address'];

  dynamic toJson() {
    return {
      'id': id,
      'parameters': parameters,
      'totalConsumption': totalConsumption,
      'totalGeneral': totalGeneral,
      'isBill': isBill,
      'queryCode': queryCode,
      'companyCode': companyCode,
      'serviceCode': serviceCode,
      'serviceCodeDescription': serviceCodeDescription,
      'amount': amount,
      'clientName': clientName,
      'companyName': companyName,
      'information': information,
      'quotaNumber': quotaNumber,
      'rejectionCause': rejectionCause,
      'operationStatusId': operationStatusId,
      'nus': nus,
      'accountNumber': accountNumber,
      'address': address
    };
  }
}
