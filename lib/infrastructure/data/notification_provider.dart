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
    // List<NotificationModel> notifications =[];
    const api = ApiKeys.notification;
    final response = await dioAuth.dio.get(api);
    try {
      statusDynamic.statusCode = response.statusCode;
      if (response.statusCode == ResultKey.successCode) {
        final comeJson = response.data;
        NotificationModel notifications = NotificationModel.fromJson(comeJson);
        statusDynamic.data = notifications;
      } else {
        eeee("GET-notification url: $api , response: ${response.data}");
      }
    } catch (e) {
      print(e);
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> removeNotification(
      {required String notificationId}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.notificationDelete + "/$notificationId";

    final response = await dioAuth.dio.delete(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
    } else {
      eeee(
          "removeNotification result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
