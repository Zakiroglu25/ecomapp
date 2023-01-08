import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/status_dynamic.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../config/dio_auth.dart';

class MessengerProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getMessage() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.getMessenger;
    final response = await dioAuth.dio.get(api);



    return statusDynamic;
  }
}
