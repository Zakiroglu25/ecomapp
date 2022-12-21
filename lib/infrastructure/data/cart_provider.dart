// Dart imports:
// Package imports:

import 'package:uikit/infrastructure/model/response/search_items.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/cart_items.dart';
import '../model/response/status_dynamic.dart';

class CartProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> addCart(
      {required String? itemGuid, required int? amount}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.cart;
    final body = ApiKeys.addCart(itemGuid: itemGuid, amount: amount);
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("addCart:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic<List<CartItem>>> getCartItems() async {
    StatusDynamic<List<CartItem>> statusDynamic = StatusDynamic();
    const api = ApiKeys.cart;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      List<CartItem> cartItems =
          (response.data as List).map((e) => CartItem.fromJson(e)).toList();
      statusDynamic.data = cartItems;
    } else {
      eeee("getCart List:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> deleteCart({required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.cart;
    final response = await dioAuth.dio.delete(api + "/$guid");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("delete cart:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
