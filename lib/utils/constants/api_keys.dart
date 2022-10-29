// Flutter imports:

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://doctoro-dev.ml';

  ///delete
  static const headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-mask-jwt":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJkb2N0b3JvIiwiYXVkIjoiZG9jdG9ybyIsInN1YiI6IjJjMDk1ZWU0LWU4ZTAtNDk1ZC1hMDU2LWQ4ZjgyYzdmMWUzNiIsImN1c3RvbWVyR3VpZCI6IjJjMDk1ZWU0LWU4ZTAtNDk1ZC1hMDU2LWQ4ZjgyYzdmMWUzNiIsImlzVGVtcCI6ZmFsc2UsImV4cCI6MTY2NjY4MzM3NX0.TAEHHHU7GfFg5_VHkbmbl6L1Yeo4lwXe_HuWJF85315SV9MhZnWj7ukkc6BVvuVpfGl4IifYR_PgKSzzWwuOSw",
  };

  //reg and login
  static const login = "$baseUrl/public/auth/login";

  // register
  static const registerPersonal = "$baseUrl/public/onboarding/sign-up";

  //user
  static const user = "$baseUrl/protected/customer/account";

  //address
  static const getAddress = "$baseUrl/protected/customer/address-book";

  //forgot
  static const forgotOtp = "$baseUrl/user/otp";
  static const forgotOtpApprove = "$baseUrl/user/otp/approve";

  //contact
  static const contact = "$baseUrl/public/contacts";

  //map
  static const stores = "$baseUrl/protected/stores";

  //product_options
  static const productOptions = "$baseUrl/protected/product-options/search";
  //get product guid
  static const productOptionsGuid = "$baseUrl/protected/product-options";

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
      "newsletterSubscription": ads,
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
      'x-mask-jwt': '$token',
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }
}
