// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'infrastructure/config/dio_auth.dart';
import 'infrastructure/config/dio_general.dart';
import 'infrastructure/services/config_service.dart';
import 'infrastructure/services/device_info_service.dart';
import 'infrastructure/services/hive_service.dart';

DioG get dioG => locator<DioG>();

final _navigatorKey = GlobalKey<NavigatorState>();
final ctx = _navigatorKey.currentContext;
final locator = GetIt.I;
final dio = Dio();

Future<void> setupLocator() async {
  locator.registerSingleton<GlobalKey<NavigatorState>>(_navigatorKey);
  final hiveMain = await HiveService.instance;
  final hiveConfig = await ConfigService.instance;
  // final hiveConfig = await ConfigService.instance;
  final dioG = await DioG.instance;

  //   locator.registerSingleton<PreferencesService>(prefs);
  // locator.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
  locator.registerLazySingleton(() => hiveConfig);
  locator.registerLazySingleton(() => hiveMain);
  //locator.registerSingleton<DioG>(await DioG.instance);
  locator.registerLazySingleton<DioG>(() => dioG);
  final dioA = await DioAuth.instance;
  locator.registerLazySingleton<DioAuth>(() => dioA);

  //services

  locator.registerLazySingleton<DeviceInfoService>(
      () => DeviceInfoService.instance);

  // locator.registerLazySingleton<RegisterRepository>(() => RegisterS)
}
