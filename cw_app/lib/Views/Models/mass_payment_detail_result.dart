class MassPaymentDetailResult {
  int line;
  String accountNumber;
  double amount;
  String gloss;
  String titular;
  String documentType;
  String documentNumber;
  String documentExtension;
  String firstDetail;
  String secondDetail;
  String email;
  String telephoneNumber;
  String description;
  String name;
  String firstLastName;
  String secondLastName;
  String branchOfficeDescription;
  String details;
  String instruccionsPayment;
  String bankDescription;
  String destinationAccount;
  String beneficiaryReason;
  String instructions;
  String emailProvider;
  String targetAccount;
  String beneficiary;
  String mail;
  String placeDelivery;
  String detail;
  String typeIdc;
  String idc;
  String extensionIdc;
  String glossDeposit;
  String businessName;
  String socialReason;
  String typeDocument;
  String document;
  String extensionDocument;
  String addressDelivery;
  String numberTransact;
  String serviceCode;
  String paymentType;
  String titularName;
  String code;

  MassPaymentDetailResult() {
    this.line = 0;
    this.accountNumber = '';
    this.amount = 0;
    this.gloss = '';
    this.titular = '';
    this.documentType = '';
    this.documentNumber = '';
    this.documentExtension = '';
    this.firstDetail = '';
    this.secondDetail = '';
    this.email = '';
    this.telephoneNumber = '';
    this.description = '';
    this.name = '';
    this.firstLastName = '';
    this.secondLastName = '';
    this.branchOfficeDescription = '';
    this.details = '';
    this.instruccionsPayment = '';
    this.bankDescription = '';
    this.destinationAccount = '';
    this.beneficiaryReason = '';
    this.instructions = '';
    this.emailProvider = '';
    this.targetAccount = '';
    this.beneficiary = '';
    this.mail = '';
    this.placeDelivery = '';
    this.detail = '';
    this.typeIdc = '';
    this.idc = '';
    this.extensionIdc = '';
    this.glossDeposit = '';
    this.businessName = '';
    this.socialReason = '';
    this.typeDocument = '';
    this.document = '';
    this.extensionDocument = '';
    this.addressDelivery = '';
    this.numberTransact = '';
    this.serviceCode = '';
    this.paymentType = '';
    this.titularName = '';
    this.code = '';
  }

  MassPaymentDetailResult.fromJson(Map json)
      : this.line = json['line'],
        this.accountNumber = json['accountNumber'],
        this.amount = json['amount'],
        this.gloss = json['gloss'],
        this.titular = json['titular'],
        this.documentType = json['documentType'],
        this.documentNumber = json['documentNumber'],
        this.documentExtension = json['documentExtension'],
        this.firstDetail = json['firstDetail'],
        this.secondDetail = json['secondDetail'],
        this.email = json['email'],
        this.telephoneNumber = json['telephoneNumber'],
        this.description = json['description'],
        this.name = json['name'],
        this.firstLastName = json['firstLastName'],
        this.secondLastName = json['secondLastName'],
        this.branchOfficeDescription = json['branchOfficeDescription'],
        this.details = json['details'],
        this.instruccionsPayment = json['instruccionsPayment'],
        this.bankDescription = json['bankDescription'],
        this.destinationAccount = json['destinationAccount'],
        this.beneficiaryReason = json['beneficiaryReason'],
        this.instructions = json['instructions'],
        this.emailProvider = json['emailProvider'],
        this.targetAccount = json['targetAccount'],
        this.beneficiary = json['beneficiary'],
        this.mail = json['mail'],
        this.placeDelivery = json['placeDelivery'],
        this.detail = json['detail'],
        this.typeIdc = json['typeIdc'],
        this.idc = json['idc'],
        this.extensionIdc = json['extensionIdc'],
        this.glossDeposit = json['glossDeposit'],
        this.businessName = json['businessName'],
        this.socialReason = json['socialReason'],
        this.typeDocument = json['typeDocument'],
        this.document = json['document'],
        this.extensionDocument = json['extensionDocument'],
        this.addressDelivery = json['addressDelivery'],
        this.numberTransact = json['numberTransact'],
        this.serviceCode = json['serviceCode'],
        this.paymentType = json['paymentType'],
        this.titularName = json['titularName'],
        this.code = json['code'];

  dynamic toJson() {
    return {
      'line': line,
      'accountNumber': accountNumber,
      'amount': amount,
      'gloss': gloss,
      'titular': titular,
      'documentType': documentType,
      'documentNumber': documentNumber,
      'documentExtension': documentExtension,
      'firstDetail': firstDetail,
      'secondDetail': secondDetail,
      'email': email,
      'telephoneNumber': telephoneNumber,
      'description': description,
      'name': name,
      'firstLastName': firstLastName,
      'secondLastName': secondLastName,
      'branchOfficeDescription': branchOfficeDescription,
      'details': details,
      'instruccionsPayment': instruccionsPayment,
      'bankDescription': bankDescription,
      'destinationAccount': destinationAccount,
      'beneficiaryReason': beneficiaryReason,
      'instructions': instructions,
      'emailProvider': emailProvider,
      'targetAccount': targetAccount,
      'beneficiary': beneficiary,
      'mail': mail,
      'placeDelivery': placeDelivery,
      'detail': detail,
      'typeIdc': typeIdc,
      'idc': idc,
      'extensionIdc': extensionIdc,
      'glossDeposit': glossDeposit,
      'businessName': businessName,
      'socialReason': socialReason,
      'typeDocument': typeDocument,
      'document': document,
      'extensionDocument': extensionDocument,
      'addressDelivery': addressDelivery,
      'numberTransact': numberTransact,
      'serviceCode': serviceCode,
      'paymentType': paymentType,
      'titularName': titularName,
      'code': code
    };
  }
}
