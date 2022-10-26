// Dart imports:
import 'package:dio/dio.dart';
import 'package:doctoro/infrastructure/model/locale/MyUser.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/status_dynamic.dart';

class AccountProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> fetchUserInfo({
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.user;
    final header = ApiKeys.header(token: token);
    final response = await dioAuth.dio.get(api, options: Options(headers: header));

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      MyUser userResult = MyUser.fromJson(gelenCavabJson);
      statusDynamic.data = userResult;
    } else {
      eeee("fetchUserInfo bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

}
