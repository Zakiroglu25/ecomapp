// Dart imports:
// Package imports:

import 'package:uikit/utils/enums/transaction_type.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/address_model.dart';
import '../model/response/status_dynamic.dart';
import '../services/hive_service.dart';

class AddressProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<List<Address>> getAddresses() async {
    List<Address> statusDynamic = [];
    const api = ApiKeys.getAddress;
    final response = await dioAuth.dio.get(api);
    if (response.statusCode.isSuccess) {
      final comeJson = response.data;
      statusDynamic = addressFromJson(comeJson);

    } else {
      eeee("address List:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> addAddress({
    required String? title,
    required String? streetName,
    required String? houseNumber,
    required String? city,
    required String? country,
    required String? phone,
    required String? latitude,
    required String? longitude,
    required String? description,
    required bool? isMain,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.getAddress;
    var body = ApiKeys.addressBody(
        title: title,
        streetName: streetName,
        houseNumber: houseNumber,
        city: city,
        country: country,
        phone: phone,
        latitude: latitude,
        longitude: longitude,
        description: description,
        isMain: isMain);
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("add or edit adress bad url :$api ,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> delete({required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.getAddress + "/$guid";
    final response = await dioAuth.dio.delete(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("deleteAddress bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> update({
    required String guid,
    required Address address,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.getAddress + "/$guid";
    final data = address.toJson();
    final response = await dioAuth.dio.put(api, data: data);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("deleteAddress bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }
}
