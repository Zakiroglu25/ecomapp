// Flutter imports:
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
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

  String get fcmToken {
    //final deviceCode = await _fcm.getToken();
    final fcmToken = 'token';
    return fcmToken;
  }
}
