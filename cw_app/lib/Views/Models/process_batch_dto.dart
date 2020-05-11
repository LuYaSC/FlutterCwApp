import 'package:cw_app/Views/Models/cismart_approver_dto.dart';
import 'package:cw_app/Views/Models/uif_dto.dart';

class ProcessBatchDto {
  int operationTypeId;
  int sourceAccountId;
  String sourceAccount;
  double amount;
  String sourceCurrency;
  String currency;
  DateTime dateProcess;
  String description;
  bool isScheduledProcess;
  String scheduledProcessString;
  DateTime scheduledProcess;
  bool isMultipleDebits;
  String operationNumberDebitHost;
  bool isTicket;
  int numberTicket;
  double preferentialExchange;
  String indicatorBuyOrSale;
  int operationStatusId;
  String tokenCode;
  String tokenName;
  String fundSource;
  String fundDestination;
  List<UifDto> uif;
  String sendVouchers;
  List<int> approvers;
  List<int> controllers;
  List<CismartApproverDto> cismartApprovers;
  bool isPrePreparer;

  ProcessBatchDto() {
    this.operationTypeId = 0;
    this.sourceAccountId = 0;
    this.sourceAccount = '';
    this.amount = 0;
    this.sourceCurrency = '';
    this.currency = '';
    this.dateProcess = DateTime.now();
    this.description = '';
    this.isScheduledProcess = false;
    this.scheduledProcessString = '';
    this.scheduledProcess = DateTime.now();
    this.isMultipleDebits = false;
    this.operationNumberDebitHost = '';
    this.isTicket = false;
    this.numberTicket = 0;
    this.preferentialExchange = 0;
    this.indicatorBuyOrSale = '';
    this.operationStatusId = 0;
    this.tokenCode = '';
    this.tokenName = '';
    this.fundSource = '';
    this.fundDestination = '';
    this.uif = new List<UifDto>();
    this.sendVouchers = '';
    this.approvers = new List<int>();
    this.controllers = new List<int>();
    this.cismartApprovers = new List<CismartApproverDto>();
    this.isPrePreparer = false;
  }

  ProcessBatchDto.fromJson(Map json)
      : operationTypeId = json['operationTypeId'],
        sourceAccountId = json['sourceAccountId'],
        sourceAccount = json['sourceAccount'],
        amount = json['amount'],
        sourceCurrency = json['sourceCurrency'],
        currency = json['currency'],
        dateProcess = json['dateProcess'],
        description = json['description'],
        isScheduledProcess = json['isScheduledProcess'],
        scheduledProcessString = json['scheduledProcessString'],
        scheduledProcess = json['scheduledProcess'],
        isMultipleDebits = json['isMultipleDebits'],
        operationNumberDebitHost = json['operationNumberDebitHost'],
        isTicket = json['isTicket'],
        numberTicket = json['numberTicket'],
        preferentialExchange = json['preferentialExchange'],
        indicatorBuyOrSale = json['indicatorBuyOrSale'],
        operationStatusId = json['operationStatusId'],
        tokenCode = json['tokenCode'],
        tokenName = json['tokenName'],
        fundSource = json['fundSource'],
        fundDestination = json['fundDestination'],
        uif = json['uif'],
        sendVouchers = json['sendVouchers'],
        approvers = json['approvers'],
        controllers = json['controllers'],
        cismartApprovers = json['cismartApprovers'],
        isPrePreparer = json['isPrePreparer'];
  dynamic toJson() {
    return {
      'operationTypeId': operationTypeId,
      'sourceAccountId': sourceAccountId,
      'sourceAccount': sourceAccount,
      'amount': amount,
      'sourceCurrency': sourceCurrency,
      'currency': currency,
      'dateProcess': dateProcess,
      'description': description,
      'isScheduledProcess': isScheduledProcess,
      'scheduledProcessString': scheduledProcessString,
      'scheduledProcess': scheduledProcess,
      'isMultipleDebits': isMultipleDebits,
      'operationNumberDebitHost': operationNumberDebitHost,
      'isTicket': isTicket,
      'numberTicket': numberTicket,
      'preferentialExchange': preferentialExchange,
      'indicatorBuyOrSale': indicatorBuyOrSale,
      'operationStatusId': operationStatusId,
      'tokenCode': tokenCode,
      'tokenName': tokenName,
      'fundSource': fundSource,
      'fundDestination': fundDestination,
      'uif': uif,
      'sendVouchers': sendVouchers,
      'approvers': approvers,
      'controllers': controllers,
      'cismartApprovers': cismartApprovers,
      'isPrePreparer': isPrePreparer,
    };
  }
}
