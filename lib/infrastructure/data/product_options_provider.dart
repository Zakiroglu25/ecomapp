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

// static Future<ProductOptionDetailsModel?> getByGuid(String guid) async {
//   ProductOptionDetailsModel? productOptionDetailsModel;
//   const api = ApiKeys.productOptionsGuid;
//   var headers = ApiKeys.header(token: _prefs.accessToken);
//   var url = Uri.parse(api + '/$guid');
//   final response = await http.get(url, headers: headers);
//   wtf(response.body);
//   if (response.statusCode == ResultKey.successCode) {
//     final comeJson = jsonDecode(response.body);
//     productOptionDetailsModel = ProductOptionDetailsModel.fromJson(comeJson);
//     wtf(productOptionDetailsModel.guid.toString());
//   } else {
//     eeee("address List:  url: $api , response: ${response.body}");
//   }
//
//   return productOptionDetailsModel;
// }
}
