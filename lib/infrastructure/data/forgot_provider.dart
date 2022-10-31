import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/status_dynamic.dart';

class ForgotProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> sendMail({
    required String? phone,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.forgotOtp;

    final body = {
      "phone": phone,
    };
    final response = await dioG.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode.isSuccess) {
      statusDynamic.data = response.data;
    } else {
      statusDynamic.data = response.data;
      eeee(
          "sendMail result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> addCode({
    required String? phone,
    required String? code,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.forgotOtpApprove;

    final body = {"phone": phone, 'otp': code};
    final response = await dioG.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      statusDynamic.data = response.data;
    } else {
      eeee(
          "addCode result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
