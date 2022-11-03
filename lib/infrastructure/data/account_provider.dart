// Dart imports:
import 'package:dio/dio.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/locale/MyUser.dart';
import '../model/response/status_dynamic.dart';

class AccountProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> fetchUserInfo({
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.user;
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

  //User Update

  static Future<StatusDynamic?> updateUserInfo({
    required String? phone,
    required String? email,
    required String? name,
    required String? patronymic,
    required String? birthday,
    required String? finCode,
    required int? insuranceId,
    required bool? newsletterSubscription,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.user;
    final body = ApiKeys.updateAccountBody(
      phone: phone,
      email: email,
      name: name,
      finCode: finCode,
      birthday: birthday,
      patronymic: patronymic,
      insuranceId: insuranceId,
      newsletterSubscription: false,
    );

    final response = await dioAuth.dio.post(api,
        data: body, options: Options(headers: {'Accept': "application/json"}));
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
//User Update

}
