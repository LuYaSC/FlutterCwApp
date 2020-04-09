import 'package:date_format/date_format.dart';

class TrackingBatch {
  int id;
  String name;
  int operationTypeId;
  int accountId;
  String formattedAccount;
  double amount;
  String currency;
  String dateCreation;
  String dateProcess;
  String description;
  bool isAuth;
  bool isCtrl;
  bool isScheduledProcess;
  String scheduledProcess;
  String beneficiary;
  bool isAuthorizerControl;
  bool isSignerScheme;

  TrackingBatch() {
    this.id = 0;
    this.name = '';
    this.operationTypeId = 0;
    this.accountId = 0;
    this.formattedAccount = '';
    this.amount = 0;
    this.currency = '';
    this.dateCreation = '';
    this.dateProcess = '';
    this.description= '';
    this.isAuth = false;
    this.isCtrl = false;
    this.isScheduledProcess = false;
    this.scheduledProcess = '';
    this.beneficiary = '';
    this.isAuthorizerControl = false;
    this.isSignerScheme = false;
  }

  TrackingBatch.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        operationTypeId = json['operationTypeId'],
        accountId = json['accountId'],
        formattedAccount = json['formattedAccount'],
        amount = json['amount'],
        currency = json['currency'],
        dateCreation = formatDate(DateTime.parse(json['dateCreation']), [yyyy, '-', mm, '-', dd ,' ', HH, ':', nn, ':', ss, ' ', am]),
        dateProcess = formatDate(DateTime.parse(json['dateProcess']), [yyyy, '-', mm, '-', dd ,' ', HH, ':', nn, ':', ss, ' ', am]),
        description = json['description'],
        isAuth = json['isAuth'],
        isCtrl = json['isCtrl'],
        isScheduledProcess = json['isScheduledProcess'],
        scheduledProcess = formatDate(DateTime.parse(json['scheduledProcess']), [yyyy, '-', mm, '-', dd ,' ', HH, ':', nn, ':', ss, ' ', am]),
        beneficiary = json['beneficiary'],
        isAuthorizerControl = json['isAuthorizerControl'],
        isSignerScheme = json['isSignerScheme'];

  dynamic toJson() {
    return {
      'id': id,
      'name': name,
      'operationTypeId': operationTypeId,
      'accountId': accountId,
      'formattedAccount': formattedAccount,
      'amount': amount,
      'currency': currency,
      'dateCreation': dateCreation,
      'dateProcess': dateProcess,
      'description': description,
      'isAuth': isAuth,
      'isCtrl': isCtrl,
      'isScheduledProcess': isScheduledProcess,
      'scheduledProcess': scheduledProcess,
      'beneficiary': beneficiary,
      'isAuthorizerControl': isAuthorizerControl,
      'isSignerScheme': isSignerScheme,
    };
  }
}
