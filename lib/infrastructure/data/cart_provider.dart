// Dart imports:
// Package imports:

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

  static Future<StatusDynamic<CartInfo>> getCartItems() async {
    StatusDynamic<CartInfo> statusDynamic = StatusDynamic();
    const api = ApiKeys.cart;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = CartInfo.fromJson(response.data);
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

  static Future<StatusDynamic> orderRegister({String? addressGuid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.ordersRegister;
    final body = ApiKeys.ordersRegisterBody(addressGuid: addressGuid);
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("delete cart:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> deleteCartPrescription(
      {required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.cart;
    final response = await dioAuth.dio.delete(api + "/$guid/prescription");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("delete cart:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> addCartPrescription(
      {required String cartGuid, required String prescriptionGuid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.cart;
    final response = await dioAuth.dio
        .post(api + "/$cartGuid/prescription/$prescriptionGuid");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("delete cart:  url: $api , response: ${response.data}");
    }

    return statusDynamic;
  }
}
