// Dart imports:
import 'dart:convert';

import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/locale/MyUser.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class AccountProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static HiveService get _prefs => locator<HiveService>();

  static Future<StatusDynamic> fetchUserInfo({
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.account;
    final response = await dioAuth.dio.get(api);

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final res = response.data;
      MyUser userResult = MyUser.fromJson(res);
      statusDynamic.data = userResult;
    } else {
      eeee("fetchUserInfo bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> sendDevice({
    required String? deviceFcmToken,
    required String? deviceTypeId,
    required String? deviceName,
  }) async {
    StatusDynamic<MyUser> statusDynamic = StatusDynamic<MyUser>();
    var api = ApiKeys.devices;
    final data = ApiKeys.deviceBody(
        fcmToken: deviceFcmToken,
        deviceTypeId: deviceTypeId,
        deviceName: deviceName);
    final response = await dioAuth.dio.post(api, data: data);

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("sendDevice bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> changePhone({
    required String? phone,
    required String? password,
  }) async {
    StatusDynamic<MyUser> statusDynamic = StatusDynamic<MyUser>();
    var api = ApiKeys.changeNumber;
    final data = ApiKeys.changePhoneBody(phone: phone, password: password);
    print(data);
    final response = await dioAuth.dio.post(api, data: data);
    print(response.statusMessage);
    print(response.statusCode);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("changePhone bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

  //User Update

  static Future<StatusDynamic?> updateUserInfo({
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
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.account;
    Uri url = Uri.parse(api);
    final body = ApiKeys.updateAccountBody(
      phone: phone,
      email: email,
      firstName: firstName,
      patronymic: patronymic,
      lastName: lastName,
      birthday: birthday,
      finCode: finCode,
      // insuranceId: insuranceId,
      idSerialNumber: idSerialNumber,
      newsletterSubscription: false,
    );
    final response = await dioAuth.dio.put(api, data: jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      statusDynamic.data = response.data['errors'][0][0];
      eeee("updateAccountBody bad url :$api, response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<bool?> deleteAccount() async {
    var api = ApiKeys.rtbf;
    final response = await dioAuth.dio.post(api);
    if (response.statusCode.isSuccess) {
      return true;
    } else {
      eeee("deleteAccount bad url :$api, response: ${response}");
    }
    return null;
  }

//User Update

}
