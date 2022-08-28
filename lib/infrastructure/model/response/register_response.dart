class RegisterResponse {
  String? time;
  String? message;
  String? details;
  int? status;
  Validation? validation;

  RegisterResponse(
      {this.time, this.message, this.details, this.status, this.validation});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
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
  String? password;
  String? phone;
  String? email;

  Validation({this.password, this.phone, this.email});

  Validation.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}