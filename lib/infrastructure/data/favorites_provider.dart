import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/product_option_model.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class FavoritesProvider {

  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getFavorite(int page) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.favorite;
    final response =
        await dioAuth.dio.get(api, queryParameters: {"page": page});
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      FavResult model = FavResult.fromJson(response.data);
      statusDynamic.data = model;
    } else {
      eeee("getFavorite List:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> addFavorite(String guid) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.favorite;
    final response = await dioAuth.dio.post(api+"/$guid");
    print("provider 1" + response.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {

    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
