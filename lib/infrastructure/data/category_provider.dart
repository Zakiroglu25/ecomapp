import 'dart:convert';

import 'package:doctoro/infrastructure/model/response/status_dynamic.dart';
import 'package:doctoro/utils/constants/result_keys.dart';
import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_details_model.dart';
import '../model/response/product_option_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider{
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getCategoryTree(int page) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.getCategoryTree;
    final response =
    await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;
      ProductOptionModel model = ProductOptionModel.fromJson(comeJson);
      statusDynamic.data = model.data;
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

}
