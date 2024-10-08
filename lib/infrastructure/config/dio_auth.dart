import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/infrastructure/data/auth_provider.dart';
import 'package:uikit/infrastructure/services/navigation_service.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/index.dart';
import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../../utils/screen/alert.dart';
import '../model/response/detailed_error.dart';
import '../model/response/error_response.dart';
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
        followRedirects: true,
        //headers: ApiKeys.header(token: _prefs.accessToken),
        validateStatus: (status) {
          return status! < 500;
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

    super.onRequest(options, handler);
    //return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // TODO: implement onResponse

    if (response.statusCode == null) return;
    switch (response.statusCode) {
      case 401:
      case 403:
        refreshToken(handler: handler, response: response)
            .then((value) => _retry(response.requestOptions));
        break;
      default:
        break;
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

    switch (err.response?.statusCode) {
      case 200:
      case 201:
        break;
      case 500:
        final error = ErrorResponse.fromJson(err.response?.data);
        switch (error.status) {
          case 10005:
            // Go.to(
            //     NavigationService.instance.navigationKey!.currentContext!,
            //     Pager.otp(
            //         phone: _prefs.phoneNumber,
            //         email: _prefs.email,
            //         requestNew: true));
            // handler.next(err);
            return;
        }
        break;
      default:
        break;
    }
  }

  Future<void> refreshToken(
      {required ResponseInterceptorHandler handler,
      required Response? response}) async {
    final res = await AuthProvider.refreshToken();

    if (res.statusCode.isSuccess && response != null) {
      final accessToken = res.data['accessToken'];
      await _prefs.persistAccessToken(accessToken: accessToken);
      return handler.resolve(response);
    }
  }

  // Future<void> refreshToken2(
  //     {required ResponseInterceptorHandler handler,
  //     required Response? response}) async {
  //   final res = await AuthProvider.refreshToken();
  //   if (res.statusCode.isSuccess && response != null) {
  //     handler.resolve(response);
  //   }
  // }

  void _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);

    options.headers!['x-mask-jwt'] = _prefs.accessToken;

    await dioG.dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}

class CustomInterceptors extends Interceptor {
  HiveService get _prefs => locator<HiveService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        'REQUEST[${options.method}] => PATH: ${options.path} => queryParameters: ${options.queryParameters}');
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
    if (response.statusCode == null) return;
    if (response.statusCode.isSuccess ||
        response.statusCode == 403 ||
        response.statusCode == 401 ||
        response.statusCode! >= 500) return;
    switch (response.statusCode) {
      case 200:
      case 201:
        break;
      case 413:
        Alert.show(NavigationService.instance.navigationKey!.currentContext!,
            title: MyText.unknownError, mainButtonColor: MyColors.brand);
        break;
      default:
        final error = DetailedError.fromJson(response.data);
        Alert.show(NavigationService.instance.navigationKey!.currentContext!,
            content: error.details ?? '',
            title: MyText.error,
            mainButtonColor: MyColors.brand);
        break;
    }
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // eeee(
    //     'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // Recorder.recordDioError(err);
    //return
    if (_isServerDown(err)) {
      Alert.show(NavigationService.instance.navigationKey!.currentContext!,
          content: MyText.networkError,
          title: MyText.error,
          mainButtonColor: MyColors.brand);
    }
    super.onError(err, handler);
  }

  bool _isServerDown(DioError error) {
    return (error.error is SocketException) ||
        (error.type == DioErrorType.connectTimeout);
  }
}
