class AddressModel {
  String? guid;
  String? title;
  String? streetName;
  num? streetNumber;
  String? houseNumber;
  num? postCode;
  String? phone;
  String? country;
  String? city;
  num? region;
  String? latitude;
  String? longitude;
  String? description;
  bool? isMain;

  AddressModel(
      {this.guid,
      this.title,
      this.streetName,
      this.streetNumber,
      this.houseNumber,
      this.postCode,
      this.phone,
      this.country,
      this.city,
      this.region,
      this.latitude,
      this.longitude,
      this.description,
      this.isMain});

  AddressModel.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    streetName = json['streetName'];
    streetNumber = json['streetNumber'];
    houseNumber = json['houseNumber'];
    postCode = json['postCode'];
    phone = json['phone'];
    country = json['country'];
    city = json['city'];
    region = json['region'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    isMain = json['isMain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['title'] = this.title;
    data['streetName'] = this.streetName;
    data['streetNumber'] = this.streetNumber;
    data['houseNumber'] = this.houseNumber;
    data['postCode'] = this.postCode;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['city'] = this.city;
    data['region'] = this.region;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['isMain'] = this.isMain;
    return data;
  }
}
