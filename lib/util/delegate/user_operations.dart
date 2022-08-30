import 'package:doctoro/util/delegate/my_printer.dart';
import 'package:doctoro/util/delegate/request_control.dart';

import '../../infrastructure/config/dio_auth.dart';
import '../../infrastructure/data/account_provider.dart';
import '../../infrastructure/model/locale/MyUser.dart';
import '../../infrastructure/services/config_service.dart';
import '../../infrastructure/services/hive_service.dart';
import '../../locator.dart';

class UserOperations {
  static HiveService get _prefs => locator<HiveService>();

  static ConfigService get _configs => locator<ConfigService>();

  static Future<void> configureUserDataWhenLogin(
      //MyUser user,
      {
      // required String fcmToken,
      required String accessToken,
      required String? path}) async {
    //llll("configureUserData result result: " + user.toString());
    try {
      await _prefs.persistAccessToken(accessToken: accessToken);
      await _prefs.persistIsGuest(false);
      await _prefs.persistPath(path!);
      await _prefs.persistIsLoggedIn(true);
      // await _prefs.persistFcmToken(fcmToken: fcmToken);
      if (locator.isRegistered(instance: await DioAuth.instance)) {
        locator.unregister(instance: await DioAuth.instance);
      }
      locator.registerSingleton(await DioAuth.instance);
      final result = await AccountProvider.fetchUserInfo(token: accessToken);
      MyUser user = (result!.data as MyUser);
      await _prefs.persistUser(user: user);
      await _configs.persistEmail(email: user.email);
      // locator.resetLazySingleton(instance: DioAuth.instance);

      // await FirestoreDBService.readConfig();
      // await FirestoreDBService.saveUserPath(user, path, fcmToken, accessToken);
    } catch (e, s) {
      print("configureUserData e: $e => s: $s");
      // Recorder.recordCatchError(e, s);
    }
  }

  static Future<bool> configUserDataWhenOpenApp({
    required accessToken,
  }) async {
    wtf("1");
    MyUser userData;
    wtf("2");
    try {
      wtf("3");
      final result = await AccountProvider.fetchUserInfo(token: accessToken);
      wtf(result.toString());

      wtf("4");
      if (isSuccess(result!.statusCode)) {
        wtf("5");
        userData = result.data;
        wtf("6");
        await _prefs.persistUser(user: userData);
        wtf("7");
        iiii("configUserDataWhenOpenApp + userData" + userData.toString());
        iiii("configUserDataWhenOpenApp + prefsuser" + _prefs.user.toString());
        await _prefs.persistIsGuest(false);
        await _prefs.persistIsLoggedIn(true);
        return true;
      } else
        return false;
    } catch (e, s) {
      wtf("eeee configUserDataWhenOpenApp $e => $s");
      return false;
    }
  }
}
