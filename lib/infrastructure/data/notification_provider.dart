import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/constants/result_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';
import '../model/response/notification_model.dart';
import '../model/response/status_dynamic.dart';

class NotificationProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic> getNotification() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.notification;
    final response = await dioAuth.dio.get(api);
    wtf(response.toString());
    try {
      statusDynamic.statusCode = response.statusCode;
      if (response.statusCode == ResultKey.successCode) {
        NotificationModel model = NotificationModel.fromJson(response.data);
        statusDynamic.data = model;
      } else {
        eeee("GET-notification url: $api , response: ${response.data}");
      }
    } catch (e) {
      print(e);
    }
    return statusDynamic;
  }
}
