// Flutter imports:
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DeviceInfoService {
  FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static DeviceInfoService? _instance;

  DeviceInfoService._internal();

  static DeviceInfoService get instance {
    _instance ??= DeviceInfoService._internal();
    return _instance!;
  }

  String get platformId {
    if (Platform.isAndroid) {
      return '1';
    } else if (Platform.isIOS) {
      return '2';
    } else {
      return '1';
    }
  }

  Future<String> get deviceName async {
    String deviceName;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;
      deviceName =
          '${androidDeviceInfo.brand} ${androidDeviceInfo.model} | Android: ${androidDeviceInfo.version.release}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      deviceName =
          '${iosDeviceInfo.name!} | iOS: ${iosDeviceInfo.systemVersion}';
    } else {
      deviceName = 'unknown device';
    }
    return deviceName;
  }

  Future<String> get fcmToken async {
    final fcmToken = await _fcm.getToken();
    return fcmToken!;
  }
}
