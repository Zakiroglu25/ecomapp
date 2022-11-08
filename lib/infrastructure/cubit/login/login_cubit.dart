// Dart imports:
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../../utils/screen/snack.dart';
import '../../../utils/validators/validator.dart';
import '../../config/recorder.dart';
import '../../data/auth_provider.dart';
import 'login_state.dart';

// Project imports:

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool emailValid = false;

  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();
  final BehaviorSubject<String> uPass = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  Stream<String> get passStream => uPass.stream;

  updateEmail(String value) {
    if (value == null || value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError(MyText.all_fields_must_be_filled);
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
  }

  updatePass(String value) {
    if (value == null || value.isEmpty) {
      uPass.value = '';
      uPass.sink.addError(MyText.field_is_not_correct);
    } else {
      uPass.sink.add(value);
    }
  }

  bool get isPassIncorrect =>
      (!uPass.hasValue || uPass.value == null || uPass.value.isEmpty);

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

  @override
  Future<void> close() {
    uPass.close();
    uEmail.close();
    return super.close();
  }

  void login(BuildContext context, {bool? loading}) async {
    try {
      if (loading ?? true) {
        emit(LoginInProgress());
      }

      // final email = "bxtyr1903@gmail.com";
      // final pass = 'Baxtiyar1993';

      //final deviceCode = await _fcm.getToken();
      final fcmToken = 'token';
      final response = await AuthProvider.login(
        email: uEmail.valueOrNull,
        password: uPass.valueOrNull,
        fcmToken: fcmToken,
      );

      if (response.statusCode.isSuccess) {
        final tokens = response.data;

        await UserOperations.configureUserDataWhenLogin(
          accessToken: tokens['accessToken'],
          refreshToken: tokens['refreshToken'],
          path: uPass.valueOrNull,
        );
        Go.andRemove(context, Pager.app(showSplash: true));
        emit(LoginSuccess(''));
      } else {
        Snack.display(message: MyText.emailOrPassNotCorrect);
        emit(LoginError());
      }
    } on SocketException catch (_) {
      emit(LoginError(error: 'network_error'));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(LoginError(error: e.toString()));
    }
  }

  bool isUserInfoValid() {
    if (!isPassIncorrect && !isEmailIncorrect) {
      return true;
    } else {
      return false;
    }
  }
}
