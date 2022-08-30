// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
import 'package:doctoro/infrastructure/model/response/address_model.dart';
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../../util/constants/api_keys.dart';
import '../../util/constants/result_keys.dart';
import '../../util/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/status_dynamic.dart';

class AddressProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> getAddresses({required String? token}) async {
    StatusDynamic? statusDynamic = StatusDynamic();
    const api = ApiKeys.getAddress;
    var url = Uri.parse(api);
    final header = ApiKeys.header(token: token);
    final response =
        await dioAuth.dio.get(api, options: Options(headers: header));
    if (statusDynamic.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      iiii(gelenCavabJson.toString());
      iiii(response.statusCode.toString());
      AddressModel addressModel = AddressModel.fromJson(gelenCavabJson);
      iiii(addressModel.toString());
      statusDynamic.data = addressModel;
    } else {
      eeee("getOrders bad url :$url,response: $response");
    }
    return statusDynamic;
  }
}
