// Dart imports:
// Package imports:

import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/order_status.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/order_details.dart';
import '../model/response/orders_data.dart';
import '../model/response/status_dynamic.dart';

class OrdersProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

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

  static Future<CartOrdersData?> pendingOrders({int? page}) async {
    final List<String> waitingTabStatusList = [
      OrderStatus.PENDING_APPROVAL,
      OrderStatus.PENDING_PAYMENT,
      OrderStatus.PAYMENT_UNSUCCESSFUL,
      OrderStatus.REJECTED,
      OrderStatus.APPROVED
    ];
    final api =
        ApiKeys.orders + '?status=${waitingTabStatusList.join(',')}&page=$page';
    final response = await dioAuth.dio.get(api);
    if (response.statusCode.isSuccess) {
      return CartOrdersData.fromJson(response.data);
    } else {
      eeee("pendingOrders:  url: $api , response: ${response.data}");
    }
    return null;
  }

  static Future<OrderDetails?> orderDetails({required String guid}) async {
    final api = ApiKeys.orders + '/$guid';
    final response = await dioAuth.dio.get(api);
    if (response.statusCode.isSuccess) {
      return OrderDetails.fromJson(response.data);
    } else {
      eeee("orderDetails:  url: $api , response: ${response.data}");
    }
    return null;
  }
}
