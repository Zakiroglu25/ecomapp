// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../locator.dart';
import '../../utils/constants/colors.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // await Firebase.initializeApp();
  // await requestPermission();
  await Hive.initFlutter();
  await setupLocator();

  // FirebaseCrashlytics.instance.crash();
  //FirebaseCrashlytics.instance.crash();
  // final remoteConfig = FirebaseRemoteConfig.instance;
  // await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //   fetchTimeout: const Duration(minutes: 1),
  //   minimumFetchInterval: const Duration(minutes: 15),
  // ));

  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // if (Configs.enableLogging) {
  //   //LoggingService(Configs.enableLogging);
  //   //Bloc.observer = AppBlocObserver();
  //   dio.interceptors.add(LogInterceptorService());
  // }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: MyColors.white,
    statusBarIconBrightness: Brightness.light,
    statusBarColor: MyColors.main, // status bar color
  ));

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  //
  // AwesomeNotifications().initialize(
  //   // set the icon to null if you want to use the default app icon
  //   'resource://drawable/circle_icon',
  //   [
  //     NotificationChannel(
  //         channelGroupKey: 'sound_tests',
  //         //icon: 'resource://drawable/res_power_ranger_thunder',
  //         channelKey: "custom_sound",
  //         channelName: "Custom sound notifications",
  //         channelDescription: "Notifications with custom sound",
  //         playSound: false,
  //         soundSource: 'resource://raw/alert',
  //         defaultColor: Colors.red,
  //         ledColor: Colors.red,
  //         vibrationPattern: lowVibrationPattern),
  //   ],
  //   channelGroups: [
  //     NotificationChannelGroup(
  //         channelGroupkey: 'sound_tests', channelGroupName: 'Basic group')
  //   ],
  // );
  //
  // AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //   if (!isAllowed) {
  //     // Insert here your friendly dialog box before call the request method
  //     // This is very important to not harm the user experience
  //     AwesomeNotifications().requestPermissionToSendNotifications();
  //   }
  // });
}
