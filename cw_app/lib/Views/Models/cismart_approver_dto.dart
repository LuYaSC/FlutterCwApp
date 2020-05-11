class CismartApproverDto {
  String idc;
  int id;
  int type;

  CismartApproverDto() {
    this.idc = '';
    this.id = 0;
    this.type = 0;
  }

  CismartApproverDto.fromJson(Map json)
      : idc = json['idc'],
        id = json['id'],
        type = json['type'];

  dynamic toJson() {
    return {
      'idc': idc,
      'id': id,
      'type': type,
    };
  }
}
