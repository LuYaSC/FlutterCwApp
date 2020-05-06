import 'package:date_format/date_format.dart';

class MassPaymentHeaderResult {
  String paymentType;
  bool isScheduledProcess;
  String scheduledProcess;
  bool isMultipleDebits;
  bool isTicket;
  int numberTicket;
  double preferentialExchange;
  String fundSource;
  String fundDestination;
  String statusOperation;

  MassPaymentHeaderResult() {
    this.paymentType = '';
    this.isScheduledProcess = false;
    this.scheduledProcess = '';
    this.isMultipleDebits = false;
    this.isTicket = false;
    this.numberTicket = 0;
    this.preferentialExchange = 0;
    this.fundSource = '';
    this.fundDestination = '';
    this.statusOperation = '';
  }

  MassPaymentHeaderResult.fromJson(Map json)
      : paymentType = json['paymentType'],
        isMultipleDebits = json['isMultipleDebits'],
        isTicket = json['isTicket'],
        numberTicket = json['numberTicket'],
        preferentialExchange = json['preferentialExchange'],
        isScheduledProcess = json['isScheduledProcess'],
        scheduledProcess = formatDate(
            DateTime.parse(json['scheduledProcess']), [yyyy, '-', mm, '-', dd]),
        fundSource = json['fundSource'],
        fundDestination = json['fundDestination'],
        statusOperation = json['statusOperation'];

  dynamic toJson() {
    return {
      'paymentType': paymentType,
      'isScheduledProcess': isScheduledProcess,
      'scheduledProcess': scheduledProcess,
      'isMultipleDebits': isMultipleDebits,
      'isTicket': isTicket,
      'numberTicket': numberTicket,
      'preferentialExchange': preferentialExchange,
      'fundSource': fundSource,
      'fundDestination': fundDestination,
      'statusOperation': statusOperation,
    };
  }
}
