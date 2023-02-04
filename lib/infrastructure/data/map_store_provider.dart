// Dart imports:
// Package imports:

import 'package:uikit/infrastructure/model/response/map_medicine.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';

class MapStoreProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<List<MapMedicine>> getMarkers() async {
    List<MapMedicine> statusDynamic = [];
    const api = ApiKeys.stores;
    final response = await dioAuth.dio.get(api);
    try {
      if (response.statusCode == 200) {
        final comeJson = response.data;
        for (int i = 0; i < (comeJson as List).length; i++) {
          statusDynamic.add(MapMedicine.fromJson(comeJson[i]));
        }
      } else {
        eeee("map marker List:  url: $api , response: ${response.data}");
      }
    } catch (e) {
      eeee("map marker List:  url: $e , response: ${response.data}");
    }

    return statusDynamic;
  }
}
