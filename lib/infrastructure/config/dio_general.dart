import 'package:dio/dio.dart';

import '../../utils/constants/api_keys.dart';
import 'dio_auth.dart';

class DioG {
  static DioG? _instance;
  static late Dio dioG;

  DioG._internal();

  static Future<DioG> get instance async {
    _instance ??= DioG._internal();

    dioG = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        contentType: 'application/json',
        followRedirects: true,
        // headers: ApiKeys.header(token: _prefs.accessToken),

        validateStatus: (status) {
          // return status! < 500;
          return true;
        },
      ),
    )..interceptors.add(CustomInterceptors());

    return _instance!;
  }

  Dio get dio => dioG;
}
