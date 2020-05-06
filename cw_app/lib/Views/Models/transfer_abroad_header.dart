class AfpDetailResult {
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

  AfpDetailResult() {
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

  AfpDetailResult.fromJson(Map json)
      : fundSource = json['fundSource'],
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
