class BillAddressCresag {
  String streetType;
  String streetName;
  String doorNumber;
  String floor;
  String block;
  String lot;
  String urbanization;
  String neighborhood;
  String city;
  String province;
  String location;

  BillAddressCresag() {
    this.streetType = '';
    this.streetName = '';
    this.doorNumber = '';
    this.floor = '';
    this.block = '';
    this.lot = '';
    this.urbanization = '';
    this.neighborhood = '';
    this.city = '';
    this.province = '';
    this.location = '';
  }

  BillAddressCresag.fromJson(Map json)
      : streetType = json['streetType'],
        streetName = json['streetName'],
        doorNumber = json['doorNumber'],
        floor = json['floor'],
        block = json['block'],
        lot = json['lot'],
        urbanization = json['urbanization'],
        neighborhood = json['neighborhood'],
        city = json['city'],
        province = json['province'],
        location = json['location'];

  dynamic toJson() {
    return {
      'streetType': streetType,
      'streetName': streetName,
      'doorNumber': doorNumber,
      'floor': floor,
      'block': block,
      'lot': lot,
      'urbanization': urbanization,
      'neighborhood': neighborhood,
      'city': city,
      'province': province,
      'location': location,
    };
  }
}
