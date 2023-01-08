// import 'package:firebase_core/firebase_core.dart';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../locator.dart';
import '../../utils/constants/colors.dart';
import '../services/notification_service.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // await Firebase.initializeApp();
  await requestPermission();
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

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness:
        Platform.isAndroid ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: MyColors.white,
    statusBarIconBrightness: Brightness.light,
    statusBarColor: MyColors.main, // status bar color
  ));

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    // 'resource://drawable/circle_icon',
    null,
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        //icon: 'resource://drawable/res_power_ranger_thunder',
        channelKey: "basic_channel",
        channelName: "Basic notifications",
        channelDescription: "Notification channel for basic tests",
        playSound: true,
        // soundSource: 'resource://raw/alert',
        defaultColor: Colors.red,
        ledColor: Colors.red,
        vibrationPattern: lowVibrationPattern,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group',
      )
    ],
  );

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  log("Handling a background message: ${message.messageId}");
}
