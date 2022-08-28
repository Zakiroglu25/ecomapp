
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
      ///bunu mutle  suretde ac
      final result = await AccountProvider.fetchUserInfo(token: accessToken);
      MyUser user = (result!.data as MyUser);
      // await _prefs.persistUser(user: user);
      await _configs.persistEmail(email: user.email);
      // locator.resetLazySingleton(instance: DioAuth.instance);

      // await FirestoreDBService.readConfig();
      // await FirestoreDBService.saveUserPath(user, path, fcmToken, accessToken);
    } catch (e, s) {
      print("configureUserData e: $e => s: $s");
      // Recorder.recordCatchError(e, s);
    }
  }

  static Future<bool> configUserDataWhenOpenApp(
      {required accessToken,}) async {
    MyUser userData;
    try {
      final result = await AccountProvider.fetchUserInfo(token: accessToken);

      if (isSuccess(result!.statusCode)) {
        userData = result.data;
        //userData.cargoBalance = "0.55";
        //sorgu gonderilir ,xeta yaranarsa ve ya serverle bagli sehvlik olarsa
        //server error sehifesini goterir
        // Recorder.setUser(userData); //crashlyticse user melumatlarini gonderir
        // Recorder.setId(userData.id); //crashlyticse id setted
        // Recorder.setUserFCMtoken(fcm); //fcm token setted
        await _prefs.persistUser(user: userData);
        await _prefs.persistIsGuest(false);
        await _prefs.persistIsLoggedIn(true);
        return true;
      } else
        return false;
    } catch (e, s) {
      print("eeee configUserDataWhenOpenApp $e => $s");
      // Recorder.recordCatchError(e, s);
      return false;
    }
    // print("token: " + accessToken.toString());

    //FirestoreDBService.saveUser(userData!);
  }
}
