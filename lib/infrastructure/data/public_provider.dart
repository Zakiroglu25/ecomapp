import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
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
}
