// Dart imports:
// Package imports:

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/address_model.dart';
import '../model/response/status_dynamic.dart';

class AddressProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<List<AddressModel>> getAddresses() async {
    List<AddressModel> statusDynamic = [];
    const api = ApiKeys.getAddress;
    final response = await dioAuth.dio.get(api);
    try {
      if (response.statusCode == 200) {
        final comeJson = response.data;
        for (int i = 0; i < (comeJson as List).length; i++) {
          statusDynamic.add(AddressModel.fromJson(comeJson[i]));
        }
      } else {
        eeee("address List:  url: $api , response: ${response.data}");
      }
    } catch (e) {
      eeee("address List:  url: $e , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> addAddress({
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

  static Future<StatusDynamic?> delete({required int guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.getAddress + "$guid";
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("deleteAddress bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }
}
