// Flutter imports:
import 'dart:io';

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://doctoro-dev.ml';

  ///delete
  static const headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  //reg and login
  static const login = "$baseUrl/public/auth/login";

  // register
  static const registerPersonal = "$baseUrl/public/onboarding/sign-up";

  //user
  static const user = "$baseUrl/protected/customer/account";


  //forgot
  static const forgotOtp = "$baseUrl/user/otp";
  static const forgotOtpApprove = "$baseUrl/user/otp/approve";

  //contact
  static const contact = "$baseUrl/public/contacts";




  static loginBody({
    required String? email,
    required String? password,
    // required String? device_name,
    // required String? language,
    // required int? deviceTypeId,
    // required String? deviceCode,
  }) {
    //
    final map = {
      "username": email,
      "password": password,
      // "device_name": device_name,
      // "deviceName": device_name,
      // "deviceTypeId": deviceTypeId,
      // "deviceCode": deviceCode,
      // "language": language,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static orderViaLinkBody({
    required String? link,
    required double? price,
    required double? cargo_price,
    required String? detail,
    required int? qty,
    int? id,
  }) {
    //
    final map = {
      "link": link,
      "id": id,
      "qty": qty,
      "price": price,
      "cargo_price": cargo_price,
      "detail": detail,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationBusinessBody({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? language,
    required String? deviceCode,
    required int? deviceTypeId,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? company_name,
    required String? tax_number,
  }) {
    //
    final map = {
      "name": name,
      "surname": surname,
      "address": address,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "phone": phone,
      "accept": 1,
      "company_name": company_name,
      "tax_number": tax_number,
      "deviceCode": deviceCode,
      "deviceTypeId": deviceTypeId,
      "language": language
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static reportBody({
    required String? store,
    required int? qty,
    required int? category,
    required String? tracking,
    required double? price,
    required String? currency,
    required File? invoice,
    required String? note,
  }) {
    //
    final Map<String, dynamic> map = {
      "store": store,
      "qty": qty,
      "category": category,
      "tracking": tracking,
      "price": price,
      "currency": currency,
      "note": note,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationPersonalBody({
    required String? email,
    required String? password,
    required String? phone,
    required bool? ads,
  }) {
    final map = {
      "email": email,
      "password": password,
      "phone": phone,
      "newsletterSubscription": false,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static updateAccountBody({
    required String? address,
    required String? language,
    required String? email,
    required String? password,
    required String? old_password,
    required String? password_confirmation,
    required String? phone,
    //required int? accept,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? company_name,
    required String? tax_number,
    required int? ware_house,
  }) {
    final map = {
      "password": password,
      "password_confirmation": password_confirmation,
      "birthday": birthday,
      "id_number": id_number,
      "fin": fin,
      "city": 1,
      "address": address,
      "email": email,
      "company_name": company_name,
      "tax_number": tax_number,
      "phone": phone,
      "ware_house": 1,
      "language": language
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static header({
    required String? token,
  }) {
    //
    final map = {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
      //'Bearer 767|sCxXpk9PKU5QdCKcaLBh2Tj3t5QG0gQYOqLTcY8f',
      "Content-Type": "application/json",
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }
}
