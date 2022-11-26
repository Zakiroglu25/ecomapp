class MyUser {
  // "idSerialNumber": "1223232",
  String? phone;
  String? email;
  String? firstName;
  String? patronymic;
  String? lastName;
  String? birthDate;
  String? finCode;
  String? idSerialNumber;

  num? insuranceId;
  bool? newsletterSubscription;

  MyUser(
      {this.phone,
      this.email,
        this.idSerialNumber,
      this.firstName,
      this.patronymic,
      this.lastName,
      this.birthDate,
      this.finCode,
      this.insuranceId,
      this.newsletterSubscription});

  MyUser.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    firstName = json['firstName'];
    patronymic = json['patronymic'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    finCode = json['finCode'];
    insuranceId = json['insuranceId'];
    idSerialNumber = json['idSerialNumber'];
    newsletterSubscription = json['newsletterSubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = phone;
    data['email'] = email;
    data['firstName'] = firstName;
    data['patronymic'] = patronymic;
    data['lastName'] = lastName;
    data['birthDate'] = birthDate;
    data['finCode'] = finCode;
    data['insuranceId'] = insuranceId;
    data['idSerialNumber'] = idSerialNumber;
    data['newsletterSubscription'] = newsletterSubscription;
    return data;
  }
}
