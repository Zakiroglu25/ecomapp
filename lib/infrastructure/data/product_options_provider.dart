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

  static Future<StatusDynamic> getProductByGuidForMap({required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.stock+"/search?StoreGuid=" + '$guid';
    wtf(api.toString());
    final response = await dioAuth.dio.get(api);
    wtf("1");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      wtf("2");
      final comeJson = response.data;
      wtf("3");
      SearchItems model = SearchItems.fromJson(comeJson);
      wtf("4");
      statusDynamic.data = model;
      iiii(model.toString());
    } else {
      wtf("5");
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
