import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final messaging = FirebaseMessaging.instance;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> onBackgroundMessage(RemoteMessage message) async {
  debugPrint('onBackgroundMessage: ${message}');
  await Future.delayed(const Duration(milliseconds: 200));
  // showNotificationCustomSound(message);
}

void configureFcm({String? topic, required BuildContext context}) async {
  await initializeFCMNotification();

  if (Platform.isIOS) {
    await requestPermission();
  }

  FirebaseMessaging.instance.getInitialMessage().then((value) {
    final Map<String, dynamic>? data = value?.data;
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    final type = event.data['type'];

    if (type != null && type == 'ready') {
      // _refreshData(context);
    }
  });

  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  messaging.subscribeToTopic('all');
  messaging.subscribeToTopic('1.0.0');
  messaging.subscribeToTopic('test1');
}

void _refreshData(BuildContext context) {
  //context read get messenger olacaq refresh ucun
}

initializeFCMNotification() async {
  FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance; // Change here
  _firebaseMessaging.getToken().then((token) {
    print("token is $token");
  });
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );

  const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (var payload) {
    //return
    onSelectNotification(payload);
  });
}

Future onSelectNotification(var payload) async {
  if (payload != null) {
    //debugPrint('notification payload: ' + payload);
    // launch(payload);
  }
}

Future<bool> requestPermission() async {
  var settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    return true;
  }

  return false;
}
