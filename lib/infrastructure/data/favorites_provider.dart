import 'dart:convert';

import 'package:uikit/infrastructure/model/response/favorite_model.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_model.dart';

import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class FavoritesProvider {
  static HiveService get _prefs => locator<HiveService>();

  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getFavorite(int page) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.favorite;
    final response =
        await dioAuth.dio.get(api, queryParameters: {"page": page});
    print("provider 1" + response.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      print("provider 2");
      final comeJson = response.data;
      print("provider 3");
      ProductOptionModel model = ProductOptionModel.fromJson(comeJson);
      print("provider 4");
      statusDynamic.data = model.data;
      print("provider 5");
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> addFavorite(String guid) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.favorite;
    final response = await dioAuth.dio.post(api + "/$guid");
    print("provider 1" + response.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      print("provider 2");
      final comeJson = response.data;
      print("provider 3");
      ProductOptionModel model = ProductOptionModel.fromJson(comeJson);
      print("provider 4");
      statusDynamic.data = model.data;
      print("provider 5");
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
