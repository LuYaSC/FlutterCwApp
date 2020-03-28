class CompanyInformation {
  String companyName;
  String companyDocument;
  double companyLimit;
  bool isConsultant;
  bool isPreparer;
  bool isController;
  bool isAuthorizer;
  String userName;
  String userDocument;
  double userLimit;

  CompanyInformation() {
    this.companyName = '';
    this.companyDocument = '';
    this.companyLimit = 0;
    this.isConsultant = false;
    this.isPreparer = false;
    this.isController = false;
    this.isAuthorizer = false;
    this.userName = '';
    this.userDocument = '';
    this.userLimit = 0;
  }

  CompanyInformation.fromJson(Map json)
      : companyName = json['companyName'],
        companyDocument = json['companyDocument'],
        companyLimit = json['companyLimit'],
        isConsultant = json['isConsultant'],
        isPreparer = json['isPreparer'],
        isController = json['isController'],
        isAuthorizer = json['isAuthorizer'],
        userName = json['userName'],
        userDocument = json['userDocument'],
        userLimit = json['userLimit'];

  dynamic toJson() {
    return {
      'companyName': companyName,
      'companyDocument': companyDocument,
      'companyLimit': companyLimit,
      'isConsultant': isConsultant,
      'isPreparer': isPreparer,
      'isController': isController,
      'isAuthorizer': isAuthorizer,
      'userName': userName,
      'userDocument': userDocument,
      'userLimit': userLimit
    };
  }
}
