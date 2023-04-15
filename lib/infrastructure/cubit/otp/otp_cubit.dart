// Dart imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/data/auth_provider.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/app_operations.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../../utils/screen/overlay_loader.dart';
import '../../config/recorder.dart';
import '../../services/hive_service.dart';
import '../../services/navigation_service.dart';
import 'otp_state.dart';
// Project imports:

class OTPCubit extends Cubit<OtpState> {
  OTPCubit({this.requestNew = false}) : super(OtpInitial()) {
    email = _prefs.email;
    phone = _prefs.phoneNumber;
    if (requestNew)
      requestOtp();
    else
      emit(OtpRequested());
  }

  HiveService get _prefs => locator<HiveService>();
  BuildContext outContext =
      NavigationService.instance.navigationKey!.currentContext!;

  bool emailValid = false;

  String? phone;
  String? email;
  final bool requestNew;
  final BehaviorSubject<String> otp = BehaviorSubject<String>();

  Stream<String> get otpStream => otp.stream;
  TextEditingController otpController = TextEditingController();
  FocusNode otpFocus = FocusNode();

  updateOtp(String value) {
    if (value.isEmpty) {
      otp.value = '';
      otpController.text = '';
      otpFocus.requestFocus();
      otp.sink.addError(MyText.field_is_not_correct);
    } else {
      otp.sink.add(value);
    }
  }

  bool get isOtpIncorrect =>
      (!otp.hasValue || otp.value.length != 6 || otp.value.isEmpty);

  @override
  Future<void> close() {
    otp.close();
    return super.close();
  }

  void requestOtp({bool? loading}) async {
    try {
      if (loading ?? true) {
        emit(OtpInProgress());
      }
      final res = await AuthProvider.requestOtp(phone: phone, email: email);
      if (res.statusCode.isSuccess) emit(OtpRequested());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OtpError(error: e.toString()));
    }
  }

  void validateOtp(BuildContext context, {bool? loading}) async {
    Loader.show(context);
    try {
      if (loading ?? false) {
        emit(OtpInProgress());
      }
      final formattedPhone = AppOperations.formatNumberWith994(phone);
      final response = await AuthProvider.validateOtp(
          email: email, phone: formattedPhone, otp: otp.valueOrNull);
      if (!response.statusCode.isSuccess) {
        updateOtp('');

        //emit(OtpError());
        return;
      }
      final tokens = response.data;

      await UserOperations.configureUserDataWhenLogin(
          accessToken: tokens['accessToken'],
          refreshToken: tokens['refreshToken'],
          email: email,
          phone: formattedPhone);
      Go.andRemove(outContext, Pager.app(showSplash: true));
      emit(OtpSuccess(''));
      //
      //
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OtpError(error: e.toString()));
    } finally {
      Loader.hide();
    }
  }

  bool isUserInfoValid() {
    if (!isOtpIncorrect) {
      return true;
    } else {
      return false;
    }
  }
}
