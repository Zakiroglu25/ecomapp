import 'package:uikit/infrastructure/model/response/status_dynamic.dart';
import 'package:uikit/utils/constants/result_keys.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_details_model.dart';
import '../model/response/product_option_model.dart';

class ProductOptionsProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getProduct(int page) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.productOptions;
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

  static Future<StatusDynamic> getByGuid(String guid) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.productOptionsGuid;
    final response = await dioAuth.dio.get(api + "/$guid");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;
      ProductOptionDetailsModel model =
          ProductOptionDetailsModel.fromJson(comeJson);
      statusDynamic.data = model;
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
