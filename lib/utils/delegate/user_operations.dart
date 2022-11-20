import 'package:uikit/utils/delegate/request_control.dart';

import '../../infrastructure/config/dio_auth.dart';
import '../../infrastructure/config/recorder.dart';
import '../../infrastructure/data/account_provider.dart';
import '../../infrastructure/model/locale/MyUser.dart';
import '../../infrastructure/services/config_service.dart';
import '../../infrastructure/services/device_info_service.dart';
import '../../infrastructure/services/hive_service.dart';
import '../../locator.dart';

class UserOperations {
  static HiveService get _prefs => locator<HiveService>();

  static ConfigService get _configs => locator<ConfigService>();

  static DeviceInfoService get _devInfo => locator<DeviceInfoService>();

  static Future<void> configureUserDataWhenLogin(
      {required String accessToken,
      required String refreshToken,
      String? path}) async {
    try {
      await _prefs.persistAccessToken(accessToken: accessToken);
      await _prefs.persistRefreshToken(refreshToken: refreshToken);
      if (path != null) await _prefs.persistPath(path);

      final deviceFcmToken = _devInfo.fcmToken;
      final devicePlatformId = _devInfo.platformId;
      final deviceName = await _devInfo.deviceName;

      await configUserDataWhenOpenApp(
          fcm: deviceFcmToken, path: path, accessToken: accessToken);

      await AccountProvider.sendDevice(
          deviceFcmToken: deviceFcmToken,
          deviceName: deviceName,
          deviceTypeId: devicePlatformId);
      // await FirestoreDBService.readConfig();
      // await FirestoreDBService.saveUserPath(user, path, fcmToken, accessToken);
    } catch (e, s) {
      print("configureUserData e: $e => s: $s");
      Recorder.recordCatchError(e, s);
    }
  }

  static Future<bool> configUserDataWhenOpenApp(
      {required accessToken, required fcm, String? path}) async {
    try {
      await register();
      await _prefs.persistAccessToken(accessToken: accessToken);
      final result = await AccountProvider.fetchUserInfo(token: accessToken);
      // final deleteAccountu =
      //     await remoteConfig.getBool(SharedKeys.deleteAccount);
      //bool deleteAccount = false;
      // (await fireStore
      //     .collection('app')
      //     .doc("config")
      //     //.collection(SharedKeys.deleteAccount)
      //     .get()
      //     .then((value) {
      //   deleteAccount = value.data()![SharedKeys.deleteAccount] ?? false;
      // }));

      if (isSuccess(result!.statusCode)) {
        final MyUser user = result.data;
        //userData.cargoBalance = "0.55";
        //sorgu gonderilir ,xeta yaranarsa ve ya serverle bagli sehvlik olarsa
        //server error sehifesini goterir
        await _prefs.persistUser(user: user);
        Recorder.setUser(user); //crashlyticse user melumatlarini gonderir
        Recorder.setId("7777"); //crashlyticse id setted
        Recorder.setUserFCMtoken(fcm); //fcm token setted
        // checkAndAddAppMember(token: accessToken, user: user);

        await _prefs.persistFcmToken(fcmToken: fcm);
        await _prefs.persistIsGuest(false);
        await _prefs.persistIsLoggedIn(true);
        //await _prefs.persistDeleteAccount(deleteAccount);

        // await FirestoreDBService.readConfig();
        // if (path != null) {
        //   await FirestoreDBService.saveUserPath(user, path, fcm, accessToken);
        // }
        return true;
      } else
        return false;
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      return false;
    }
    // print("token: " + accessToken.toString());

    //FirestoreDBService.saveUser(userData!);
  }

  static Future<void> register() async {
    final dioAuth = await DioAuth.instance;
    if (locator.isRegistered(instance: dioAuth)) {
      await locator.unregister(instance: dioAuth);
      locator.registerSingleton(dioAuth);
    }
  }
}
