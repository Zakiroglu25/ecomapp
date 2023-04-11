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

  //static const productOptions = "$protected/product-options";

  static const account = "$customer/account";

  static const stock = "$protected/stock";

  static const images = "$protected/images";

  static const stockSearch = "$stock/search";

  static const content = "$protected/content";

  static const orders = "$customer/orders";

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
  static const requestOtp = "$auth/request-otp";

  // register
  static const registerPersonal = "$baseUrl/public/onboarding/sign-up";

  //user
  static const devices = "$customer/devices";
  static const changeNumber = "$account/request-update-phone-otp";

  //address
  static const getAddress = "$customer/address-book";

  //forgot
  static const forgotOtpApprove = "$auth/validate-otp";
  static const resetPassword = "$account/reset-password";

  //contact
  static const contact = "$protected/content/contacts";

  //map
  static const stores = "$protected/stores";

  //product_options
  //static const search = "$productOptions/search";

  //get product guid
  static const productOptionsGuid = "$protected/product-options";
  static const favorite = "$customer/favorites";

  //get category tree
  static const categoryTree = "$content/category-tree";
  static const getAllManufacturers = "$content/manufacturers";
  static const cartPage = "$content/cart-page";

  //rtbf
  static const rtbf = "$protected/rtbf";

  //images
  static const prescription = "$images/prescription";

  //faq
  static const faq = "$public/faq";

  //bank card
  static const card = "$customer/cards";

  //notification
  static const notification = "$protected/notifications";
  static const notificationDelete = "$protected/notifications";

  //cart
  static const cart = "$customer/cart";

  //orders
  static const ordersRegister = "$orders/register";
  static const createPayment = "$orders/create-payment";

  //general
  static const localityInfoBigData = '$bigDataCloud/reverse-geocode-client';
  static const localityInfoGoogleMap = '$googleMap/json';

  //Messenger
  static const getMessenger = "$protected/chat";

  //insurance
  static const insurance = "$protected/insurance";
  static const addInsurance = "$insurance/add";
  static const validateInsurance = "$insurance/validate-otp";

  //change password
  static const changePass = "$account/update-password";

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
    required String? email,
  }) {
    //
    final map = {"phone": phone, "otp": otp, "email": email};

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static changePhoneBody({
    required String? phone,
    required String? password,
  }) {
    //
    final map = {"phone": phone, "password": password};

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static changePassword({
    required String? oldPass,
    required String? newPass,
  }) {
    //
    final map = {"oldPass": oldPass, "newPass": newPass};

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationPersonalBody({
    required String? email,
    required String? password,
    required String? phone,
    required String? firstName,
    required String? lastName,
    required bool? ads,
  }) {
    final map = {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
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

  static addInsuranceBody({
    required String? phoneNumber,
    required String? policyNumber,
    required String? finCode,
  }) {
    final map = {
      "policyNumber": policyNumber,
      "phoneNumber": phoneNumber,
      "finCode": finCode,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static validateInsuranceBody({
    required String? otp,
    required String? policyNumber,
  }) {
    final map = {"policyNumber": policyNumber, "otp": otp};

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
    required double? latitude,
    required double? longitude,
    required String? description,
    required bool? isMain,
  }) {
    //
    final map = {
      "title": title,
      "streetName": streetName,
      "streetNumber": null,
      "houseNumber": houseNumber,
      "postCode": null,
      "city": city,
      "country": country,
      "phone": phone,
      "region": null,
      "latitude": latitude,
      "longitude": longitude,
      "description": description,
      "isMain": isMain,
    };
    // {
    //   "title": "Close to Ganjlik Mall",
    // "streetName": "Mohsun Sanani 45/55",
    // "streetNumber": null,
    // "houseNumber": null,
    // "postCode": null,
    // "phone": null,
    // "country": "Azerbaijan",
    // "city": "Baku",
    // "region": null,
    // "latitude": "40.399379",
    // "longitude": "49.839502",
    // "description": null,
    // "isMain": true
    // }
    // map.removeWhere(
    //     (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static addCart({
    required String? itemGuid,
    required int? amount,
  }) {
    //
    final map = {
      "stockItemGuid": itemGuid,
      "amount": amount,
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static ordersRegisterBody(
      {String? addressGuid, required bool? insuranceCoverRequested}) {
    //
    final map = {
      "paymentType": "ONLINE",
      "deliveryType": "COURIER",
      "insuranceCoverRequested": insuranceCoverRequested,
      "addressGuid": addressGuid
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static updateOrderBody(
      {String? addressGuid,
      required String? paymentType,
      required String? deliveryType}) {
    //
    final map = {
      "paymentType": paymentType,
      "deliveryType": deliveryType,
      "addressGuid": addressGuid
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static createPaymentBody(
      {required String? orderGuid,
      required String? deliveryType,
      required String? comment,
      required String? paymentType,
      required bool? saveCard,
      required String? cardGuid}) {
    //
    final map = {
      "orderGuid": orderGuid,
      "saveCard": saveCard,
      "cardGuid": cardGuid,
      "comment": comment,
      "deliveryType": deliveryType,
      "paymentType": paymentType
    };

    map.removeWhere(
        (key, value) => key == null || value == null || value == 'null');
    return map;
  }
}
