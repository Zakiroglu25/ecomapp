// Dart imports:
// Package imports:

import 'package:uikit/infrastructure/model/response/payment_url_model.dart';
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

  static Future<StatusDynamic> registerOrder(
      {String? addressGuid, required bool? insuranceCoverRequested}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.ordersRegister;
    final body = ApiKeys.ordersRegisterBody(
        addressGuid: addressGuid,
        insuranceCoverRequested: insuranceCoverRequested);
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

  static Future<CartOrdersData?> deliveryOrders({int? page}) async {
    final List<String> waitingTabStatusList = [
      OrderStatus.PACKAGING,
      OrderStatus.DELIVERED,
      OrderStatus.PICKED_UP,
      OrderStatus.READY_TO_PICK_UP,
      OrderStatus.RETURNED
    ];
    final api =
        ApiKeys.orders + '?status=${waitingTabStatusList.join(',')}&page=$page';
    final response = await dioAuth.dio.get(api);
    if (response.statusCode.isSuccess) {
      return CartOrdersData.fromJson(response.data);
    } else {
      eeee("deliveryOrders:  url: $api , response: ${response.data}");
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

  static Future<int?> updateOrderDetails({
    required String guid,
    String? addressGuid,
    required String? paymentType,
    required String? deliveryType,
  }) async {
    final api = ApiKeys.orders + '/$guid';
    final body = ApiKeys.updateOrderBody(
        addressGuid: addressGuid,
        paymentType: paymentType,
        deliveryType: deliveryType);
    final response = await dioAuth.dio.put(api, data: body);
    if (response.statusCode.isSuccess) {
      return response.statusCode;
    } else {
      eeee("orderDetails:  url: $api , response: ${response.data}");
    }
    return null;
  }

  static Future<OrderDetails?> changeNotCovered(
      {required String guid, required bool include}) async {
    final tail = include ? 'include' : 'exclude';
    final api = ApiKeys.orders + '/$guid/$tail-not-covered';
    final response = await dioAuth.dio.post(api);
    if (response.statusCode.isSuccess) {
      return OrderDetails.fromJson(response.data);
    } else {
      eeee("orderDetails:  url: $api , response: ${response.data}");
    }
    return null;
  }

  static Future<PaymentUrlModel?> createPayment(
      {required String orderGuid,
      bool? saveCard,
      String? cardGuid,
      String? comment,
      String? paymentType,
      String? deliveryType}) async {
    const api = ApiKeys.createPayment;
    final body = ApiKeys.createPaymentBody(
        orderGuid: orderGuid,
        saveCard: saveCard,
        comment: comment,
        cardGuid: cardGuid,
        deliveryType: deliveryType,
        paymentType: paymentType);
    final response = await dioAuth.dio.post(api, data: body);
    if (response.statusCode.isSuccess) {
      return PaymentUrlModel.fromJson(response.data);
    } else {
      eeee("createPayment:  url: $api , response: ${response.data}");
    }
    return null;
  }
}
