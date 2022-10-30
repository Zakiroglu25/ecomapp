class MapMedicine {
  String? guid;
  String? name;
  String? slug;
  String? website;
  bool? worksWithInsurance;
  bool? open;
  int? opensAtHour;
  int? closesAtHour;
  int? opensAtMinutes;
  int? closesAtMinutes;
  String? addressGuid;
  String? addressStreetName;
  String? addressStreetNumber;
  String? addressCity;
  String? addressCountry;
  double? addressLat;
  double? addressLong;

  MapMedicine(
      {this.guid,
        this.name,
        this.slug,
        this.website,
        this.worksWithInsurance,
        this.open,
        this.opensAtHour,
        this.closesAtHour,
        this.opensAtMinutes,
        this.closesAtMinutes,
        this.addressGuid,
        this.addressStreetName,
        this.addressStreetNumber,
        this.addressCity,
        this.addressCountry,
        this.addressLat,
        this.addressLong});

  MapMedicine.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    slug = json['slug'];
    website = json['website'];
    worksWithInsurance = json['worksWithInsurance'];
    open = json['open'];
    opensAtHour = json['opensAtHour'];
    closesAtHour = json['closesAtHour'];
    opensAtMinutes = json['opensAtMinutes'];
    closesAtMinutes = json['closesAtMinutes'];
    addressGuid = json['addressGuid'];
    addressStreetName = json['addressStreetName'];
    addressStreetNumber = json['addressStreetNumber'];
    addressCity = json['addressCity'];
    addressCountry = json['addressCountry'];
    addressLat = json['addressLat'];
    addressLong = json['addressLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['website'] = this.website;
    data['worksWithInsurance'] = this.worksWithInsurance;
    data['open'] = this.open;
    data['opensAtHour'] = this.opensAtHour;
    data['closesAtHour'] = this.closesAtHour;
    data['opensAtMinutes'] = this.opensAtMinutes;
    data['closesAtMinutes'] = this.closesAtMinutes;
    data['addressGuid'] = this.addressGuid;
    data['addressStreetName'] = this.addressStreetName;
    data['addressStreetNumber'] = this.addressStreetNumber;
    data['addressCity'] = this.addressCity;
    data['addressCountry'] = this.addressCountry;
    data['addressLat'] = this.addressLat;
    data['addressLong'] = this.addressLong;
    return data;
  }
}