import 'package:cw_app/Views/Models/users_involved.dart';
import 'package:date_format/date_format.dart';

class TrasnferDetailResult {
  String sourceAccount;
  String destinationAccount;
  String beneficiary;
  double amount;
  String currency;
  int ticketNumber;
  double preferentialExchange;
  bool isScheduledProcess;
  String scheduledProcessDate;
  String user;
  String batchStatus;
  String fundSource;
  String fundDestination;
  String bank;
  String branchOffice;
  List<UserInvolved> usersInvolved;

  TrasnferDetailResult() {
    this.sourceAccount = '';
    this.destinationAccount = '';
    this.beneficiary = '';
    this.amount = 0;
    this.currency = '';
    this.ticketNumber = 0;
    this.preferentialExchange = 0;
    this.isScheduledProcess = false;
    this.scheduledProcessDate = '';
    this.user = '';
    this.batchStatus = '';
    this.fundSource = '';
    this.fundDestination = '';
    this.bank = '';
    this.branchOffice = '';
    this.usersInvolved = new List<UserInvolved>();
  }

  TrasnferDetailResult.fromJson(Map json)
      : sourceAccount = json['sourceAccount'],
        destinationAccount = json['destinationAccount'],
        beneficiary = json['beneficiary'],
        amount = json['amount'],
        currency = json['currency'],
        ticketNumber = json['ticketNumber'],
        preferentialExchange = json['preferentialExchange'],
        isScheduledProcess = json['isScheduledProcess'],
        scheduledProcessDate = formatDate(DateTime.parse(json['scheduledProcessDate']), [yyyy, '-', mm, '-', dd]),
        user = json['user'],
        batchStatus = json['batchStatus'],
        fundSource = json['fundSource'],
        fundDestination = json['fundDestination'],
        bank = json['bank'],
        branchOffice = json['branchOffice'];

  dynamic toJson() {
    return {
      'sourceAccount': sourceAccount,
      'destinationAccount': destinationAccount,
      'beneficiary': beneficiary,
      'amount': amount,
      'currency': currency,
      'ticketNumber': ticketNumber,
      'preferentialExchange': preferentialExchange,
      'isScheduledProcess': isScheduledProcess,
      'scheduledProcessDate': scheduledProcessDate,
      'user': user,
      'batchStatus': batchStatus,
      'fundSource': fundSource,
      'fundDestination': fundDestination,
      'bank': bank,
      'branchOffice': branchOffice,
    };
  }
}
