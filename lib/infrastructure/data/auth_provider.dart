// Dart imports:
import 'dart:convert';

import 'package:doctoro/infrastructure/model/response/register_response.dart';
import 'package:doctoro/utils/extensions/index.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_general.dart';
import '../model/response/status_dynamic.dart';

class AuthProvider {
  static DioG get dioG => locator<DioG>();

  static Future<StatusDynamic> login({
    required String? password,
    required String? email,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.login;
    var url = Uri.parse(api);

    var body = ApiKeys.loginBody(
      password: password,
      email: email,
    );

    final response =
        await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));
    iiii(response.headers.toString());

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      String? accessToken = response.headers['x-mask-jwt'];
      String? refreshToken = response.headers['x-mask-refresh-jwt:'];
      Map<String, String?> tokens = {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
      statusDynamic.data = tokens;
    } else {
      eeee("Gijdedi");
    }
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
