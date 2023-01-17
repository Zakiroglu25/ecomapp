import 'dart:developer';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/insurance_model.dart';
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
      InsuranceModel model = InsuranceModel.fromJson(response.data);
      statusDynamic.data = model;
    } else {
      eeee("Get Insurance:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> addInsurance(
      {required String? policyNumber, required String? phoneNumber}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.addInsuranceApi;
    final body = ApiKeys.addInsurance(
        policyNumber: policyNumber, phoneNumber: phoneNumber);
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
      // InsuranceModel model = InsuranceModel.fromJson(response.data);
      // statusDynamic.data = model;
    } else {
      eeee("Get Insurance:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }
}