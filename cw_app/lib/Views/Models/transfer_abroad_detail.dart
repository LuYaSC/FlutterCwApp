class TransferAbroadDetail {
  String beneficiaryBusinessName;
  String beneficiaryAddress;
  String beneficiaryPhone;
  String beneficiaryNumberAccount;
  String beneficiaryPaymentConcept;
  String beneficiaryDocumentNumber;
  String beneficiaryDocumentType;
  String beneficiaryCountryResidence;
  String beneficiaryCityResidence;
  String beneficiaryEmail;
  String payerBankName;
  String payerBankCodeSwift;
  String payerBankAddress;
  String payerBankCity;
  String payerBankCountry;
  String payerBankFullData;
  String intermediaryBankName;
  String intermediaryBankCodeSwift;
  String intermediaryBankAddress;
  String intermediaryBankCity;
  String intermediaryBankCountry;
  String intermediaryBankFullData;
  String intermediaryBankNumberAccountPayer;
  String requesterBusinessName;
  String requesterAddress;
  String requesterDocumentNumber;
  String requesterPhone;
  String requesterEmail;
  String requesterNumberAccount;
  double exchangeRate;
  String transferCategoryCode;
  String transferCategory;
  String transferReason;
  String fundSource;
  String fundDestination;
  double destinationAmount;
  String destinationCurrency;
  double commissionTransfer;
  double commissionOur;
  double commissionCarta;
  bool isTicketCommission;
  String numberTicketCommission;
  double commissionAmount;
  double amountTicketCommissionOur;
  bool isTicketOtherCurrency;
  String numberTicketOtherCurrency;
  String typeTicketOtherCurrency;
  double amountTicketOtherCurrency;
  double exchangeRateOperationTicketOtherCurrency;
  double amountInDollarsTicketOtherCurrency;
  String cicTicketOtherCurrency;
  int transferOperationType;
  String companyCic;
  double ticketCommissionImporte;
  double ticketCommissionPorte;
  String tickectCommissionState;
  String comissionnZero;
  String comissionnZeroOur;
  double ticketCommissionOthers;
  String operationStatus;
  double amount;
  int operationTypeId;
  int accountId;
  String sourceAccount;
  String sourceAccountFormat;
  int companyId;
  String currency;
  String description;
  double exchangeBuy;
  double exchangeSale;
  bool isTicket;
  int numberTicket;
  double preferentialExchange;
  String indicatorBuyOrSale;
  int operationStatusId;
  int processBatchId;
  String detailCharges;

  TransferAbroadDetail() {
    this.beneficiaryBusinessName = '';
    this.beneficiaryAddress = '';
    this.beneficiaryPhone = '';
    this.beneficiaryNumberAccount = '';
    this.beneficiaryPaymentConcept = '';
    this.beneficiaryDocumentNumber = '';
    this.beneficiaryDocumentType = '';
    this.beneficiaryCountryResidence = '';
    this.beneficiaryCityResidence = '';
    this.beneficiaryEmail = '';
    this.payerBankName = '';
    this.payerBankCodeSwift = '';
    this.payerBankAddress = '';
    this.payerBankCity = '';
    this.payerBankCountry = '';
    this.payerBankFullData = '';
    this.intermediaryBankName = '';
    this.intermediaryBankCodeSwift = '';
    this.intermediaryBankAddress = '';
    this.intermediaryBankCity = '';
    this.intermediaryBankCountry = '';
    this.intermediaryBankFullData = '';
    this.intermediaryBankNumberAccountPayer = '';
    this.requesterBusinessName = '';
    this.requesterAddress = '';
    this.requesterDocumentNumber = '';
    this.requesterPhone = '';
    this.requesterEmail = '';
    this.requesterNumberAccount = '';
    this.exchangeRate = 0;
    this.transferCategoryCode = '';
    this.transferCategory = '';
    this.transferReason = '';
    this.fundSource = '';
    this.fundDestination = '';
    this.destinationAmount = 0;
    this.destinationCurrency = '';
    this.commissionTransfer = 0;
    this.commissionOur = 0;
    this.commissionCarta = 0;
    this.isTicketCommission = false;
    this.numberTicketCommission = '';
    this.commissionAmount = 0;
    this.amountTicketCommissionOur = 0;
    this.isTicketOtherCurrency = false;
    this.numberTicketOtherCurrency = '';
    this.typeTicketOtherCurrency = '';
    this.amountTicketOtherCurrency = 0;
    this.exchangeRateOperationTicketOtherCurrency = 0;
    this.amountInDollarsTicketOtherCurrency = 0;
    this.cicTicketOtherCurrency = '';
    this.transferOperationType = 0;
    this.companyCic = '';
    this.ticketCommissionImporte = 0;
    this.ticketCommissionPorte = 0;
    this.tickectCommissionState = '';
    this.comissionnZero = '';
    this.comissionnZeroOur = '';
    this.ticketCommissionOthers = 0;
    this.operationStatus = '';
    this.amount = 0;
    this.operationTypeId = 0;
    this.accountId = 0;
    this.sourceAccount = '';
    this.sourceAccountFormat = '';
    this.companyId = 0;
    this.currency = '';
    this.description = '';
    this.exchangeBuy = 0;
    this.exchangeSale = 0;
    this.isTicket = false;
    this.numberTicket = 0;
    this.preferentialExchange = 0;
    this.indicatorBuyOrSale = '';
    this.operationStatusId = 0;
    this.processBatchId = 0;
    this.detailCharges = '';
  }

  TransferAbroadDetail.fromJson(Map json)
      : beneficiaryBusinessName = json['beneficiaryBusinessName'],
        beneficiaryAddress = json['beneficiaryAddress'],
        beneficiaryPhone = json['beneficiaryPhone'],
        beneficiaryNumberAccount = json['beneficiaryNumberAccount'],
        beneficiaryPaymentConcept = json['beneficiaryPaymentConcept'],
        beneficiaryDocumentNumber = json['beneficiaryDocumentNumber'],
        beneficiaryDocumentType = json['beneficiaryDocumentType'],
        beneficiaryCountryResidence = json['beneficiaryCountryResidence'],
        beneficiaryCityResidence = json['beneficiaryCityResidence'],
        beneficiaryEmail = json['beneficiaryEmail'],
        payerBankName = json['payerBankName'],
        payerBankCodeSwift = json['payerBankCodeSwift'],
        payerBankAddress = json['payerBankAddress'],
        payerBankCity = json['payerBankCity'],
        payerBankCountry = json['payerBankCountry'],
        payerBankFullData = json['payerBankFullData'],
        intermediaryBankName = json['intermediaryBankName'],
        intermediaryBankCodeSwift = json['intermediaryBankCodeSwift'],
        intermediaryBankAddress = json['intermediaryBankAddress'],
        intermediaryBankCity = json['intermediaryBankCity'],
        intermediaryBankCountry = json['intermediaryBankCountry'],
        intermediaryBankFullData = json['intermediaryBankFullData'],
        intermediaryBankNumberAccountPayer =
            json['intermediaryBankNumberAccountPayer'],
        requesterBusinessName = json['requesterBusinessName'],
        requesterAddress = json['requesterAddress'],
        requesterDocumentNumber = json['requesterDocumentNumber'],
        requesterPhone = json['requesterPhone'],
        requesterEmail = json['requesterEmail'],
        requesterNumberAccount = json['requesterNumberAccount'],
        exchangeRate = json['exchangeRate'],
        transferCategoryCode = json['transferCategoryCode'],
        transferCategory = json['transferCategory'],
        transferReason = json['transferReason'],
        fundSource = json['fundSource'],
        fundDestination = json['fundDestination'],
        destinationAmount = json['destinationAmount'],
        destinationCurrency = json['destinationCurrency'],
        commissionTransfer = json['commissionTransfer'],
        commissionOur = json['commissionOur'],
        commissionCarta = json['commissionCarta'],
        isTicketCommission = json['isTicketCommission'],
        numberTicketCommission = json['numberTicketCommission'],
        commissionAmount = json['commissionAmount'],
        amountTicketCommissionOur = json['amountTicketCommissionOur'],
        isTicketOtherCurrency = json['isTicketOtherCurrency'],
        numberTicketOtherCurrency = json['numberTicketOtherCurrency'],
        typeTicketOtherCurrency = json['typeTicketOtherCurrency'],
        amountTicketOtherCurrency = json['amountTicketOtherCurrency'],
        exchangeRateOperationTicketOtherCurrency =
            json['exchangeRateOperationTicketOtherCurrency'],
        amountInDollarsTicketOtherCurrency =
            json['amountInDollarsTicketOtherCurrency'],
        cicTicketOtherCurrency = json['cicTicketOtherCurrency'],
        transferOperationType = json['transferOperationType'],
        companyCic = json['companyCic'],
        ticketCommissionImporte = json['ticketCommissionImporte'],
        ticketCommissionPorte = json['ticketCommissionPorte'],
        tickectCommissionState = json['tickectCommissionState'],
        comissionnZero = json['comissionnZero'],
        comissionnZeroOur = json['comissionnZeroOur'],
        ticketCommissionOthers = json['ticketCommissionOthers'],
        operationStatus = json['operationStatus'],
        amount = json['amount'],
        operationTypeId = json['operationTypeId'],
        accountId = json['accountId'],
        sourceAccount = json['sourceAccount'],
        sourceAccountFormat = json['sourceAccountFormat'],
        companyId = json['companyId'],
        currency = json['currency'],
        description = json['description'],
        exchangeBuy = json['exchangeBuy'],
        exchangeSale = json['exchangeSale'],
        isTicket = json['isTicket'],
        numberTicket = json['numberTicket'],
        preferentialExchange = json['preferentialExchange'],
        indicatorBuyOrSale = json['indicatorBuyOrSale'],
        operationStatusId = json['operationStatusId'],
        processBatchId = json['processBatchId'],
        detailCharges = json['detailCharges'];

  dynamic toJson() {
    return {
      'beneficiaryBusinessName': beneficiaryBusinessName,
      'beneficiaryAddress': beneficiaryAddress,
      'beneficiaryPhone': beneficiaryPhone,
      'beneficiaryNumberAccount': beneficiaryNumberAccount,
      'beneficiaryPaymentConcept': beneficiaryPaymentConcept,
      'beneficiaryDocumentNumber': beneficiaryDocumentNumber,
      'beneficiaryDocumentType': beneficiaryDocumentType,
      'beneficiaryCountryResidence': beneficiaryCountryResidence,
      'beneficiaryCityResidence': beneficiaryCityResidence,
      'beneficiaryEmail': beneficiaryEmail,
      'payerBankName': payerBankName,
      'payerBankCodeSwift': payerBankCodeSwift,
      'payerBankAddress': payerBankAddress,
      'payerBankCity': payerBankCity,
      'payerBankCountry': payerBankCountry,
      'payerBankFullData': payerBankFullData,
      'intermediaryBankName': intermediaryBankName,
      'intermediaryBankCodeSwift': intermediaryBankCodeSwift,
      'intermediaryBankAddress': intermediaryBankAddress,
      'intermediaryBankCity': intermediaryBankCity,
      'intermediaryBankCountry': intermediaryBankCountry,
      'intermediaryBankFullData': intermediaryBankFullData,
      'intermediaryBankNumberAccountPayer': intermediaryBankNumberAccountPayer,
      'requesterBusinessName': requesterBusinessName,
      'requesterAddress': requesterAddress,
      'requesterDocumentNumber': requesterDocumentNumber,
      'requesterPhone': requesterPhone,
      'requesterEmail': requesterEmail,
      'requesterNumberAccount': requesterNumberAccount,
      'exchangeRate': exchangeRate,
      'transferCategoryCode': transferCategoryCode,
      'transferCategory': transferCategory,
      'transferReason': transferReason,
      'fundSource': fundSource,
      'fundDestination': fundDestination,
      'destinationAmount': destinationAmount,
      'destinationCurrency': destinationCurrency,
      'commissionTransfer': commissionTransfer,
      'commissionOur': commissionOur,
      'commissionCarta': commissionCarta,
      'isTicketCommission': isTicketCommission,
      'numberTicketCommission': numberTicketCommission,
      'commissionAmount': commissionAmount,
      'amountTicketCommissionOur': amountTicketCommissionOur,
      'isTicketOtherCurrency': isTicketOtherCurrency,
      'numberTicketOtherCurrency': numberTicketOtherCurrency,
      'typeTicketOtherCurrency': typeTicketOtherCurrency,
      'amountTicketOtherCurrency': amountTicketOtherCurrency,
      'exchangeRateOperationTicketOtherCurrency':
          exchangeRateOperationTicketOtherCurrency,
      'amountInDollarsTicketOtherCurrency': amountInDollarsTicketOtherCurrency,
      'cicTicketOtherCurrency': cicTicketOtherCurrency,
      'transferOperationType': transferOperationType,
      'companyCic': companyCic,
      'ticketCommissionImporte': ticketCommissionImporte,
      'ticketCommissionPorte': ticketCommissionPorte,
      'tickectCommissionState': tickectCommissionState,
      'comissionnZero': comissionnZero,
      'comissionnZeroOur': comissionnZeroOur,
      'ticketCommissionOthers': ticketCommissionOthers,
      'operationStatus': operationStatus,
      'amount': amount,
      'operationTypeId': operationTypeId,
      'accountId': accountId,
      'sourceAccount': sourceAccount,
      'sourceAccountFormat': sourceAccountFormat,
      'companyId': companyId,
      'currency': currency,
      'description': description,
      'exchangeBuy': exchangeBuy,
      'exchangeSale': exchangeSale,
      'isTicket': isTicket,
      'numberTicket': numberTicket,
      'preferentialExchange': preferentialExchange,
      'indicatorBuyOrSale': indicatorBuyOrSale,
      'operationStatusId': operationStatusId,
      'processBatchId': processBatchId,
      'detailCharges': detailCharges,
    };
  }
}
