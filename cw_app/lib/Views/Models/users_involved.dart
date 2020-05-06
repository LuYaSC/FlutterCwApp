import 'package:date_format/date_format.dart';

class UserInvolved {
  String userDescription;
  String userName;
  String dateAction;
  String reasonRejection;

  UserInvolved() {
    this.userDescription = '';
    this.userName = '';
    this.dateAction = '';
    this.reasonRejection = '';
  }

  UserInvolved.fromJson(Map json)
      : userDescription = json['userDescription'],
        userName = json['userName'],
        dateAction = formatDate(DateTime.parse(json['dateAction']), [yyyy, '-', mm, '-', dd ,' ', HH, ':', nn, ':', ss, ' ', am]),
        reasonRejection = json['reasonRejection'];

  dynamic toJson() {
    return {
      'userDescription': userDescription,
      'userName': userName,
      'dateAction': dateAction,
      'reasonRejection': reasonRejection
    };
  }
}
