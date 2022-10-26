// Dart imports:
import 'dart:convert';

import 'package:doctoro/infrastructure/model/response/register_response.dart';
// Package imports:
import 'package:http/http.dart' as http;

import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../model/response/status_dynamic.dart';

class AuthProvider {
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
      statusDynamic.data = accessToken;
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
    var url = Uri.parse(api);

    var body = ApiKeys.registrationPersonalBody(
      email: email,
      password: password,
      phone: phone,
      ads: false,
    );

     const headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    final response =
        await http.post(url,headers: headers, body: json.encode(body));
    iiii(response.toString());
    if (response.statusCode == ResultKey.successCode) {
      iiii("Qeydiyyat ugurla tamamlandi");
    } else if (response.statusCode > 399) {
      final gelenCavabJson = jsonDecode(response.body);
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(gelenCavabJson);
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
