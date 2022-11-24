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
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      FavResult model = FavResult.fromJson(response.data);
      statusDynamic.data = model;
    } else {
      eeee("getFavorite List:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> addFavorite() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.favorite;
    final response = await dioAuth.dio.post(api);
    print("provider 1" + response.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      print("provider 2");
      final comeJson = response.data;
      print("provider 3");
      FavResult model = FavResult.fromJson(comeJson);
      print("provider 4");
      statusDynamic.data = model.products;
      print("provider 5");
    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
