// Dart imports:
// Package imports:

import 'package:uikit/infrastructure/model/response/cart_counts.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/delegate/my_printer.dart';
import '../config/dio_auth.dart';

class ContentProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<TabCounts?> getTabCounts() async {
    const api = ApiKeys.cartPage;
    final response = await dioAuth.dio.get(api);
    if (response.statusCode.isSuccess) {
      return TabCounts.fromJson(response.data);
    } else {
      eeee("getTabCounts:  url: $api , response: ${response.data}");
    }
    return null;
  }
}
