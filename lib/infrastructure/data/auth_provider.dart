// Dart imports:
import 'package:dio/dio.dart';
import 'package:uikit/infrastructure/model/response/register_response.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_general.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class AuthProvider {
  static DioG get dioG => locator<DioG>();

  static HiveService get _prefs => locator<HiveService>();

  static Future<StatusDynamic> login({
    required String? password,
    required String? email,
    required String? fcmToken,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.login;

    var body =
        ApiKeys.loginBody(password: password, email: email, fcmToken: fcmToken);

    final response = await dioG.dio.post(api, data: body);
    print(" provider 1");
    statusDynamic.statusCode = response.statusCode;
    print(" provider 2");
    if (response.statusCode == ResultKey.successCode) {
      String? accessToken =
          response.headers.map[ApiKeys.accessTokenDict]?.first;
      String? refreshToken =
          response.headers.map[ApiKeys.refreshTokenDict]?.first;
      Map<String, String?> tokens = {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
      print(" provider 3");

      statusDynamic.data = tokens;
    } else {}
    return statusDynamic;
  }

  static Future<StatusDynamic> refreshToken() async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.refreshToken;
    final headers = {
      ApiKeys.refreshTokenDict: _prefs.refreshToken,
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    final response = await dioG.dio.post(
      api,
      options: Options(headers: headers),
    );
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      String? accessToken =
          response.headers.map[ApiKeys.accessTokenDict]?.first;
      String? refreshToken =
          response.headers.map[ApiKeys.refreshTokenDict]?.first;
      Map<String, String?> tokens = {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
      statusDynamic.data = tokens;
    } else {}
    return statusDynamic;
  }

  static Future<RegisterResponse?> registration({
    required String? email,
    required String? phone,
    required String? password,
    required bool? ads,
  }) async {
    RegisterResponse registerResponse = RegisterResponse();
    var api = ApiKeys.registerPersonal;
    var body = ApiKeys.registrationPersonalBody(
      email: email,
      password: password,
      phone: phone,
      ads: false,
    );
    final response = await dioG.dio.post(api, data: body);

    if (response.statusCode.isSuccess) {
      iiii("Qeydiyyat ugurla tamamlandi");
    } else if (response.statusCode! > 399) {
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      eeee("Qeydiyyat Xetalidir" +
          "\n" +
          "email  " +
          email! +
          "\n" +
          "password   " +
          password! +
          "\n" +
          "phone   " +
          phone! +
          ads.toString());
      eeee(registerResponse.validation.toString());
      eeee(registerResponse.message.toString());
      eeee(registerResponse.validation!.email.toString());
      eeee(registerResponse.validation!.phone.toString());
      eeee(registerResponse.validation!.password.toString());
    } else {}

    return registerResponse;
  }
}
