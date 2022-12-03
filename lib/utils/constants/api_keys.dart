// Flutter imports:

import 'package:uikit/infrastructure/config/configs.dart';

class ApiKeys {
  ApiKeys._();

  static const bigDataCloud = 'https://api.bigdatacloud.net/data';
  static const googleMap = 'https://maps.googleapis.com/maps/api/geocode';

  static const baseUrl = 'https://doctoro${Configs.enviroment}.ml';
  static const public = "$baseUrl/public";
  static const auth = "$public/auth";

  static const protected = "$baseUrl/protected";

  static const customer = "$protected/customer";
  static const productOptions = "$protected/product-options";

  static const account = "$customer/account";

  static const cart = "$customer/cart";

  ///delete
  static const headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-mask-jwt":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJkb2N0b3JvIiwiYXVkIjoiZG9jdG9ybyIsInN1YiI6IjJjMDk1ZWU0LWU4ZTAtNDk1ZC1hMDU2LWQ4ZjgyYzdmMWUzNiIsImN1c3RvbWVyR3VpZCI6IjJjMDk1ZWU0LWU4ZTAtNDk1ZC1hMDU2LWQ4ZjgyYzdmMWUzNiIsImlzVGVtcCI6ZmFsc2UsImV4cCI6MTY2Njk0NjY0NH0.vYqommPEdJzJw0gNKgegZZto_AyYleJvYkJojdeoMDCGO131A3DCCuzi7--IvVrFLA1ZJ4VM6lJ03u_V6zOaIQ",
  };

  //reg and login
  static const login = "$auth/login";
  static const refreshToken = "$auth/refresh-token";
  static const validateOtp = "$auth/validate-otp";

  // register
  static const registerPersonal = "$baseUrl/public/onboarding/sign-up";

  //user
  static const user = "$account";
  static const devices = "$customer/devices";

  //address
  static const getAddress = "$customer/address-book";

  //forgot
  static const requestOtp = "$auth/request-otp";
  static const forgotOtpApprove = "$auth/validate-otp";
  static const resetPassword = "$account/reset-password";

  //cart
  //static const addCart = 'https://doctoro-dev.ml/protected/customer/cart';

  //w2qadsa

  //static const forgotOtp = "$baseUrl/user/otp";

  //contact
  static const contact = "$baseUrl/public/contacts";

  //map
  static const stores = "$baseUrl/protected/stores";

  //product_options
  static const search = "$productOptions/search";

  //get product guid
  static const productOptionsGuid = "$baseUrl/protected/product-options";
  static const favorite = "$baseUrl/protected/customer/favorites";

  //get category tree
  static const categoryTree = "$baseUrl/protected/content/category-tree";
  static const getAllManufacturers = "$baseUrl/protected/content/manufacturers";

  //faq
  static const faq = "$baseUrl/public/faq";
  //basket
  static const addBasket = "$baseUrl/$customer/cart";

  //bank card
  static const card = "$baseUrl/$customer/card";

  //general
  static const localityInfoBigData = '$bigDataCloud/reverse-geocode-client';
  static const localityInfoGoogleMap = '$googleMap/json';

  static loginBody({
    required String? email,
    required String? password,
    String? fcmToken,
  }) {
    //
    final map = {
      "username": email,
      "password": password,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static otpBody({
    required String? phone,
    required String? otp,
  }) {
    //
    final map = {"phone": phone, "otp": otp};

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

  static deviceBody({
    required String? fcmToken,
    required String? deviceTypeId,
    required String? deviceName,
  }) {
    final map = {
      "token": fcmToken,
      "deviceTypeId": deviceTypeId,
      "deviceName": deviceName
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static updateAccountBody({
    required String? phone,
    required String? email,
    required String? firstName,
    required String? lastName,
    required String? patronymic,
    required String? birthday,
    required String? finCode,
    // required int? insuranceId,
    required String? idSerialNumber,
    required bool? newsletterSubscription,
  }) {
    final map = {
      "phone": phone,
      "email": email,
      "firstName": firstName,
      "patronymic": patronymic,
      "lastName": lastName,
      "birthDate": birthday,
      "finCode": finCode,
      // "insuranceId": insuranceId,
      "idSerialNumber": idSerialNumber,
      "newsletterSubscription": newsletterSubscription,
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

  //dictionary
  static const refreshTokenDict = 'x-mask-refresh-jwt';
  static const accessTokenDict = 'x-mask-jwt';

  static addressBody({
    required String? title,
    required String? streetName,
    required String? houseNumber,
    required String? city,
    required String? country,
    required String? phone,
    required String? latitude,
    required String? longitude,
    required String? description,
    required bool? isMain,
  }) {
    //
    final map = {
      "title": title,
      "streetName": streetName,
      "houseNumber": houseNumber,
      "city": city,
      "country": country,
      "phone": phone,
      "latitude": latitude,
      "longitude": longitude,
      "description": description,
      "isMain": isMain,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }
}
