import 'package:dio/dio.dart';
import 'package:doctoro/infrastructure/model/response/address_model.dart';
import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';

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
}
