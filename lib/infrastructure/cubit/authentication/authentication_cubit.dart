import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/durations.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../../utils/screen/alert.dart';
import '../../config/recorder.dart';
import '../../data/account_provider.dart';
import '../../model/response/error_response.dart';
import '../../model/response/status_dynamic.dart';
import '../../services/config_service.dart';
import '../../services/hive_service.dart';
import '../../services/notification_service.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  HiveService get _prefs => locator<HiveService>();

  ConfigService get _configs => locator<ConfigService>();

  // MyUser? userData = MyUser();
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // final remoteConfig = FirebaseRemoteConfig.instance;

  bool? goOn; //go on prosesler bitdiyini bildirir ve davam etmeye icaze verir

  void startApp(BuildContext context, {bool showSplash = true}) async {
    if (showSplash) {
      emit(AuthenticationSplash());
    } else {
      emit(AuthenticationLoading());
    }
    try {
      // _prefs.clear();
      final String? fcm = await _fcm.getToken();
      // final String? fcm = 'test fcm';
      configureFcm(context: context);

      log("FCM token" + fcm.toString());
      //  _prefs.persistIsLoggedIn(true);
      final bool isLoggedIn = _prefs.isLoggedIn;
      final String? accessToken = _prefs.accessToken;

      bbbb("accessToken: $accessToken");
      if (isLoggedIn && accessToken != null) {
        final bool? isNumberValidated = await checkIsValidated();

        //nomrenin tesdiq olunumagini yoxlayir
        //olunmayibsa otp sehifesi acilir
        if (isNumberValidated == false) {
          emit(AuthenticationOtpRequest());
          return;
        }

        //userin girish edib etmemeyi yoxlanilir
        await Future.wait([
          //splah screen ucun min 2 san. gozledilir
          delay(showSplash),
          // eyni zamanda konfiqurasiya edilir
          UserOperations.configUserDataWhenOpenApp(
              accessToken: accessToken, fcm: fcm)
        ]);
        // if (goOn!) {
        emit(AuthenticationAuthenticated());
        //}

      } else {
        await Future.wait([
          delay(showSplash),
          // configGuest(context),
        ]);
        emit(AuthenticationUninitialized());
        //  if (goOn!) {

        // if (_configs.onBoardIsSeen) {
        //   emit(AuthenticationUninitialized());
        // } else {
        //   emit(AuthenticationOnboarding());
        // }

        //Go.to(context, Pager.login);
        // }
      }
    } on SocketException catch (_) {
      emit(AuthenticationNetworkError());
    } catch (e, s) {
      // Recorder.recordCatchError(e, s);
      eeee("AuthenticationError: $s" + e.toString());
      emit(AuthenticationError());
    }
  }

  Future<bool?> checkIsValidated({bool? loading}) async {
    try {
      final result =
      await AccountProvider.fetchUserInfo(token: _prefs.accessToken);
      if (result.statusCode.isSuccess) return true;
    } on DioError catch (err, s) {
      switch (err.response?.statusCode) {
        case 500:
          final error = ErrorResponse.fromJson(err.response?.data);
          switch (error.status) {
            case 10005:
              return false;
          }
          break;
        default:
          break;
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
    return null;
  }

  Future<void> serverControl(StatusDynamic? result, Function isSuccess) async {
    if (result != null) {
      if ((result.statusCode)! >= 500) {
        emit(AuthenticationServerError());
        goOn = false;
        return;
      } else if ((result.statusCode)! >= 300) {
        emit(AuthenticationError());
        goOn = false;
        return;
      } else {
        //hec bir xeta olmadigi hall
        isSuccess.call();
        //goOn true olanda novbeti state kecir
        goOn = true;
        return;
      }
    }
  }

  Future<void> delay(bool showSplash) async {
    if (showSplash) await Future.delayed(Duration(seconds: 2));
  }

  void showLogoutDialog(BuildContext context, {bool goWithPager = false}) {
    Alert.show(context,
        image: SizedBox(
            width: 120, height: 120, child: Image.asset(Assets.pngSetting)),
        cancelButton: true, onTap: () {
          logOut(context, goWithPager: goWithPager);
        }, title: MyText.are_u_sure_exit);
  }

  void showDeleteDialog(BuildContext context, {bool goWithPager = false}) {
    Alert.show(context,
        image: SizedBox(
            width: 120, height: 120, child: Image.asset(Assets.pngSetting)),
        cancelButton: true, onTap: () {
          deleteAccount(context, goWithPager: goWithPager);
        }, title: MyText.are_u_sure_delete_account);
  }

  void logOut(BuildContext context, {bool goWithPager = false}) async {
    try {
      //   emit(AuthenticationLoading());
      if (goWithPager) Go.andRemove(context, Pager.login);
      // emit(AuthenticationUninitialized());
      // await _prefs.persistIsLoggedIn(false);
      // //final logOutRes =
      Future.delayed(Durations.s1).then((value) => _prefs.clear());
      // //Hive.box('main').close();

      PaintingBinding.instance.imageCache.clear();
      imageCache.clear();
      Go.andRemove(context, Pager.login);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
  }

  void deleteAccount(BuildContext context, {bool goWithPager = false}) async {
    try {
      final result = await AccountProvider.deleteAccount();
      if (result.isNotNull) logOut(context);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
    }
  }

  void onBoardHaveSeen(BuildContext context) async {
    //  emit(AuthenticationLoading());
    await _configs.persistOnBoard(seen: true);
    emit(AuthenticationUninitialized());
  }
}
