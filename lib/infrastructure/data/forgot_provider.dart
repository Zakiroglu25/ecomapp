import 'package:dio/dio.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/status_dynamic.dart';

class ForgotProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> requestOTP(
      {
      //  //https://doctoro-dev.ml/public/auth/request-otp/+994505505342
      required String? phone}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.requestOtp + '/$phone';

    final response = await dioG.dio.post(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode.isSuccess) {
      statusDynamic.data = response.data;
    } else {
      statusDynamic.data = response.data;
      eeee(
          "requestOTP result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> validateOTP({
    required String? phone,
    required String? code,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.forgotOtpApprove;

    final body = {"phone": phone, 'otp': code};
    final response = await dioG.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      String? accessToken =
          response.headers.map[ApiKeys.accessTokenDict]?.first;
      statusDynamic.data = accessToken;
    } else {
      eeee(
          "addCode result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> resetPass({
    required String? token,
    required String? newPass,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.resetPassword;
    final headers = {ApiKeys.accessTokenDict: token};
    final body = {'newPass': newPass};
    final response = await dioG.dio
        .post(api, data: body, options: Options(headers: headers));
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      String? accessToken =
          response.headers.map[ApiKeys.accessTokenDict]?.first;
      statusDynamic.data = accessToken;
    } else {
      eeee(
          "addCode result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
