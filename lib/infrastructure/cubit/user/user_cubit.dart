import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:doctoro/util/delegate/my_printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../../util/delegate/user_operations.dart';
import '../../../util/screen/alert.dart';
import '../../services/hive_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  HiveService get _prefs => locator<HiveService>();

  void getUserData({bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }
    try {
      await UserOperations.configUserDataWhenOpenApp(
        // fcmToken: _prefs.fcmToken,
        accessToken: _prefs.accessToken!,
        //  path: _prefs.userPath
      );
    } catch (e, s) {
      eeee(e.toString());
    }
  }
}
