import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_model.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class ProductOptionsProvider {
  static HiveService get _prefs => locator<HiveService>();
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getProduct(int page) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.search;
    final response =
        await dioAuth.dio.get(api, queryParameters: {"page": page});
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

  static Future<StatusDynamic> getProductByGuid({required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.productOptions + '/$guid';
    final response = await dioAuth.dio.get(api);
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
