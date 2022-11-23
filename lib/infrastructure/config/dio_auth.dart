import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/infrastructure/data/auth_provider.dart';
import 'package:uikit/utils/extensions/index.dart';

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
        // contentType: 'application/json',
        queryParameters: {"Accept": "application/json"},
        followRedirects: true,
        //headers: ApiKeys.header(token: _prefs.accessToken),
        validateStatus: (status) {
          return status! < 300;
          //return true;
        },
      ),
    )
      ..interceptors.add(CustomInterceptors())
      ..interceptors.add(JwtInterceptor());

    return _instance!;
  }

  Dio get dio => dioAuth;
}

class JwtInterceptor extends Interceptor {
  HiveService get _prefs => locator<HiveService>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final sharedPrefs = await SharedPreferences.getInstance();
    final accessToken = _prefs.accessToken;
    if (accessToken != null) {
      options.headers['x-mask-jwt'] = '$accessToken';
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    switch (err.response?.statusCode) {
      case 200:
        break;
      case 401:
      case 403:
        await refreshToken(handler: handler, response: err.response);
        _retry(err.requestOptions);
        break;
      default:
        break;
    }
  }

  Future<void> refreshToken(
      {required ErrorInterceptorHandler handler,
      required Response? response}) async {
    final res = await AuthProvider.refreshToken();

    if (res.statusCode.isSuccess && response != null) {
      final accessToken = res.data['accessToken'];
      _prefs.persistAccessToken(accessToken: accessToken);
      handler.resolve(response);
    }
  }

  Future<void> refreshToken2(
      {required ResponseInterceptorHandler handler,
      required Response? response}) async {
    final res = await AuthProvider.refreshToken();
    if (res.statusCode.isSuccess && response != null) {
      handler.resolve(response);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    options.headers!['x-mask-jwt'] = _prefs.accessToken;

    return await dioG.dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
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
    if (!response.statusCode.isSuccess) {
      // llll("user: ${_prefs.user}"+"\n request body: "+response.requestOptions.data.toString());
      Recorder.recordResponseError(response);
    }
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
