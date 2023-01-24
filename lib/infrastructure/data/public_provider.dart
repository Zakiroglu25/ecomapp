import 'package:uikit/infrastructure/model/response/big_data_info.dart';
import 'package:uikit/infrastructure/model/response/google_map_model.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/configs.dart';
import '../config/dio_auth.dart';
import '../model/response/card_model.dart';
import '../model/response/contact_model.dart';
import '../model/response/faq_model.dart';
import '../model/response/status_dynamic.dart';

class PublicProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> faq() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.faq;
    final response = await dioAuth.dio.get(api);

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      FaqModel model = FaqModel.fromJson(response.data);
      statusDynamic.data = model;
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

//card
  static Future<CardListModel?> getCard() async {
    const api = ApiKeys.card;
    final response = await dioAuth.dio.get(api);
    if (response.statusCode.isSuccess) {
      return CardListModel.fromJson(response.data);
    } else {
      eeee("card List:  url: $api , response: ${response.data}");
    }
    return null;
  }

  static Future<StatusDynamic?> deleteCArd({required String guid}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.card + "/$guid";
    final response = await dioAuth.dio.delete(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("deleteCard bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

  //contact
  static Future<ContactModel> getContact() async {
    late ContactModel statusDynamic;
    const api = ApiKeys.contact;
    final response = await dioAuth.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic = ContactModel.fromJson(response.data);
    } else {
      eeee("contact List:  url: $api , response: ${response.data}");
    }
    return statusDynamic;
  }
}
