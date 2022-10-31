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
}
