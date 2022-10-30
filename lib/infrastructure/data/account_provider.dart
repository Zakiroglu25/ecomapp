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
}
