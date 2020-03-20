import 'package:date_format/date_format.dart';

class Movements {
  String date;
  String description;
  double accountingBalance;
  double availableBalance;
  double amount;
  String branch;
  String user;
  String transactionNumber;

  Movements() {
    this.date = '';
    this.description = '';
    this.accountingBalance = 0;
    this.availableBalance = 0;
    this.amount = 0;
    this.branch = '';
    this.user = '';
    this.transactionNumber = '';
  }

  Movements.fromJson(Map json)
      : date = formatDate(DateTime.parse(json['date']), [yyyy, '-', mm, '-', dd]),
        description = json['description'],
        accountingBalance = json['accountingBalance'],
        availableBalance = json['availableBalance'],
        amount = json['amount'],
        branch = json['branch'],
        user = json['user'],
        transactionNumber = json['transactionNumber'];

  dynamic toJson() {
    return { 
      'date': date,
      'description': description,
      'accountingBalance': accountingBalance,
      'availableBalance': availableBalance,
      'amount': amount,
      'branch': branch,
      'user': user,
      'transactionNumber': transactionNumber
    };
  }
}
