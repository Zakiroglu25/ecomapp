// Dart imports:
// Package imports:

import 'dart:developer';

import 'package:uikit/infrastructure/model/response/map_medicine.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/status_dynamic.dart';

class BasketProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> addCart() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.addBasket;
    const body = ({
      "itemGuid": "itemGuid",
      "amount": 1,
    });
    final response = await dioAuth.dio.post(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
