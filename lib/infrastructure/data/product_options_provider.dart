import 'package:uikit/infrastructure/model/response/search_items.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_details_model.dart';
import '../model/response/product_option_model.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class ProductOptionsProvider {
  static HiveService get _prefs => locator<HiveService>();

  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic<SearchItems>> getProduct(int page,
      {String? title}) async {
    StatusDynamic<SearchItems> statusDynamic = StatusDynamic();
    final api = ApiKeys.stockSearch; //+ '?page=$page&title=$title';
    final response = await dioAuth.dio
        .get(api, queryParameters: {"page": page, "title": title});
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      SearchItems model = SearchItems.fromJson(response.data);
      statusDynamic.data = model;
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> getProductByGuid({required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.stock + '/$guid';
    wtf(api.toString());
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;
      ProductDetails model = ProductDetails.fromJson(comeJson);
      statusDynamic.data = model;
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic<SearchItems>> getProductByGuidForMap(
      {required String guid, required int page}) async {
    StatusDynamic<SearchItems> statusDynamic = StatusDynamic();
    final api = ApiKeys.stockSearch;
    final response = await dioAuth.dio
        .get(api, queryParameters: {"StoreGuid": guid, "page": page});
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;
      SearchItems model = SearchItems.fromJson(comeJson);
      statusDynamic.data = model;
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
