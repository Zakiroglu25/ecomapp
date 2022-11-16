class ErrorModel {
  String? time;
  String? message;
  String? details;
  int? status;
  Validation? validation;

  ErrorModel(
      {this.time, this.message, this.details, this.status, this.validation});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    message = json['message'];
    details = json['details'];
    status = json['status'];
    validation = json['validation'] != null
        ? new Validation.fromJson(json['validation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['message'] = this.message;
    data['details'] = this.details;
    data['status'] = this.status;
    if (this.validation != null) {
      data['validation'] = this.validation!.toJson();
    }
    return data;
  }
}

class Validation {
  String? country;
  String? streetName;
  String? city;
  String? isMain;
  String? latitude;
  String? title;
  String? longitude;

  Validation(
      {this.country,
        this.streetName,
        this.city,
        this.isMain,
        this.latitude,
        this.title,
        this.longitude});

  Validation.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    streetName = json['streetName'];
    city = json['city'];
    isMain = json['isMain'];
    latitude = json['latitude'];
    title = json['title'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['streetName'] = this.streetName;
    data['city'] = this.city;
    data['isMain'] = this.isMain;
    data['latitude'] = this.latitude;
    data['title'] = this.title;
    data['longitude'] = this.longitude;
    return data;
  }
}