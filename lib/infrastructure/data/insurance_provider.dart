import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_model.dart';
import '../model/response/search_items.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class InsuranceProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getInsurance() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.getInsurance;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      SearchItems model = SearchItems.fromJson(response.data);
      statusDynamic.data = model;
    } else {
      eeee("Get Insurance:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  // static Future<StatusDynamic> deleteInsurance(String guid) async {
  //   StatusDynamic statusDynamic = StatusDynamic();
  //   const api = ApiKeys.Insurance;
  //   final response = await dioAuth.dio.delete(api + "/$guid");
  //   statusDynamic.statusCode = response.statusCode;
  //   if (response.statusCode == ResultKey.successCode) {
  //   } else {
  //     eeee("address List:  url: $api , response: ${response.data}");
  //   }
  //
  //   return statusDynamic;
  // }
}
