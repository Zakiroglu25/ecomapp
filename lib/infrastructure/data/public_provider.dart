import 'package:uikit/infrastructure/model/response/big_data_info.dart';
import 'package:uikit/infrastructure/model/response/google_map_model.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/configs.dart';
import '../config/dio_auth.dart';
import '../model/response/faq_model.dart';
import '../model/response/status_dynamic.dart';

class PublicProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> faq() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.faq;
    final response = await dioAuth.dio.get(api);

    iiii(response.toString());
    statusDynamic.statusCode = response.statusCode;
    print("1");
    if (response.statusCode == ResultKey.successCode) {
      print("2");
      FaqModel model = FaqModel.fromJson(response.data);
      statusDynamic.data = model;
      print("3");
    } else {
      eeee("getFavorite List:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getLocDataFromBigData(
      {required double lat, required double long}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.localityInfoBigData +
        "?latitude=$lat&longitude=$long&localityLanguage=az";
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data =
          BigDataCloudResponse.fromJson(gelenCavabJson).localityInfo;
    } else {
      eeee(
          "getLocData bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getLocDataFromGoogleMap(
      {required double lat, required double long}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.localityInfoGoogleMap +
        "?latlng=$lat,$long&key=${Configs.googleMapKey}";
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data =
          GoogleMapDataResponse.fromJson(gelenCavabJson).results;
    } else {
      eeee(
          "getLocData bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }
}
