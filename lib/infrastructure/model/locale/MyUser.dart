class MyUser {
  String? phone;
  String? email;
  String? firstName;
  num? patronymic;
  String? lastName;
  num? birthDate;
  num? finCode;
  num? insuranceId;
  bool? newsletterSubscription;

  MyUser(
      {this.phone,
        this.email,
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
    newsletterSubscription = json['newsletterSubscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['patronymic'] = this.patronymic;
    data['lastName'] = this.lastName;
    data['birthDate'] = this.birthDate;
    data['finCode'] = this.finCode;
    data['insuranceId'] = this.insuranceId;
    data['newsletterSubscription'] = this.newsletterSubscription;
    return data;
  }
}