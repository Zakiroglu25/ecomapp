import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../services/hive_service.dart';

class DioAuth {
  static HiveService get _prefs => locator<HiveService>();
  static DioAuth? _instance;
  static late Dio dioAuth;

  DioAuth._internal();

  static Future<DioAuth> get instance async {
    _instance ??= DioAuth._internal();

    dioAuth = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        contentType: 'application/json',
        queryParameters: {"Accept": "application/json"},
        followRedirects: true,
        headers: ApiKeys.header(
            token:
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJkb2N0b3JvIiwiYXVkIjoiZG9jdG9ybyIsInN1YiI6IjJjMDk1ZWU0LWU4ZTAtNDk1ZC1hMDU2LWQ4ZjgyYzdmMWUzNiIsImN1c3RvbWVyR3VpZCI6IjJjMDk1ZWU0LWU4ZTAtNDk1ZC1hMDU2LWQ4ZjgyYzdmMWUzNiIsImlzVGVtcCI6ZmFsc2UsImV4cCI6MTY2Njk0NjY0NH0.vYqommPEdJzJw0gNKgegZZto_AyYleJvYkJojdeoMDCGO131A3DCCuzi7--IvVrFLA1ZJ4VM6lJ03u_V6zOaIQ"),
        validateStatus: (status) {
          //  return status! < 500;
          return true;
        },
      ),
    )..interceptors.add(CustomInterceptors());

    return _instance!;
  }

  Dio get dio => dioAuth;
}

class JwtInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    // final accessToken = sharedPrefs.getString('accessToken');

    // if (accessToken != null) {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    handler.next(options);
  }
}

class CustomInterceptors extends Interceptor {
  HiveService get _prefs => locator<HiveService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    //
    // if (!isSuccess(response.statusCode)) {
    //   // llll("user: ${_prefs.user}"+"\n request body: "+response.requestOptions.data.toString());
    //   Recorder.recordResponseError(response);
    // }
    //  return
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // eeee(
    //     'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // Recorder.recordDioError(err);
    //return
    super.onError(err, handler);
  }
}
