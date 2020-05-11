class UifDto {
  bool isMultiple;
  bool isSuspiciusUif;
  String trace;
  int numberQueryUIF;
  double cumulus;
  String causalTransaction;
  String typeTransaction;
  String sourceFunds;
  String destinationFunds;
  String branchOffice;

  UifDto() {
    this.isMultiple = false;
    this.isSuspiciusUif = false;
    this.trace = 'SIN TRACE';
    this.numberQueryUIF = 0;
    this.cumulus = 0;
    this.causalTransaction = 'TRPRO';
    this.typeTransaction = 'LAVA';
    this.sourceFunds = 'origen de los fondos';
    this.destinationFunds = 'destino de los fondos';
    this.branchOffice = '201204';
  }

  UifDto.fromJson(Map json)
      : isMultiple = json['isMultiple'],
        isSuspiciusUif = json['isSuspiciusUif'],
        trace = json['trace'],
        numberQueryUIF = json['numberQueryUIF'],
        cumulus = json['cumulus'],
        causalTransaction = json['causalTransaction'],
        typeTransaction = json['typeTransaction'],
        sourceFunds = json['sourceFunds'],
        destinationFunds = json['destinationFunds'],
        branchOffice = json['branchOffice'];

  dynamic toJson() {
    return {
      'isMultiple': isMultiple,
      'isSuspiciusUif': isSuspiciusUif,
      'trace': trace,
      'numberQueryUIF': numberQueryUIF,
      'cumulus': cumulus,
      'causalTransaction': causalTransaction,
      'typeTransaction': typeTransaction,
      'sourceFunds': sourceFunds,
      'destinationFunds': destinationFunds,
      'branchOffice': branchOffice,
    };
  }
}
