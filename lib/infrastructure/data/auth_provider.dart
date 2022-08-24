// Dart imports:
import 'dart:convert';

import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../../util/constants/api_keys.dart';
import '../../util/constants/result_keys.dart';
import '../../util/delegate/app_operations.dart';
import '../../util/delegate/my_printer.dart';
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
    wtf("1");
    iiii(response.headers.toString());
    wtf("2");

    statusDynamic.statusCode = response.statusCode;
    wtf("3");
    iiii("status code" + response.statusCode.toString());
    if (response.statusCode == ResultKey.successCode) {
      wtf("4");
      String? accessToken = response.headers['x-mask-jwt'];
      iiii("access token x-mask-jwt" + accessToken.toString());
      wtf("5");
      statusDynamic.data = accessToken;
      iiii("new token: " + (statusDynamic.data).toString());
    } else {
      wtf("6");
      // statusDynamic.data =
      //     AppOperations.errorFromListOfListAsList2(response.body);
      eeee("login bad url :$url, response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> registrationPersonal({
    required String? email,
    required String? phone,
    required String? password,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.registerPersonal;
    var url = Uri.parse(api);

    var body = ApiKeys.registrationPersonalBody(
        email: email,
        password: password,
        phone: phone,
    );

    final response =
    await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));
    iiii(response.toString());
    iiii(response.statusCode.toString());
    iiii(response.headers.toString());
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      String accessToken = response.body;
      statusDynamic.data = accessToken;
      bbbb("new token: " + (statusDynamic.data).toString());
    } else {
      // statusDynamic.data =
      //response.body;
      // AppOperations.errorFromListOfListAsList(response.body);
      eeee("registrationPersonal bad url :$api,response: ${response}");
    }

    return statusDynamic;
  }
}
