// Dart imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/cubit/user/user_cubit.dart';
import 'package:uikit/infrastructure/data/auth_provider.dart';
import 'package:uikit/infrastructure/mixins/count_down_mixin.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/app_operations.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../../utils/enums/otp_request_kind.dart';
import '../../../utils/screen/overlay_loader.dart';
import '../../config/recorder.dart';
import '../../data/account_provider.dart';
import '../../services/hive_service.dart';
import '../../services/navigation_service.dart';
import 'otp_state.dart';
// Project imports:

class OTPCubit extends Cubit<OtpState> with CountDownMixin {
  OTPCubit(
      {this.requestNew = false,
      this.otpRequestKind,
      this.phone,
      required this.inheritedContext})
      : super(OtpInitial()) {
    email = _prefs.email;
    phone ??= _prefs.phoneNumber;
    startCountdownTimer();
    if (requestNew) {
      requestOtp();
    } else {
      emit(OtpRequested());
    }
  }

  final OtpRequestKind? otpRequestKind;

  HiveService get _prefs => locator<HiveService>();
  BuildContext inheritedContext;
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
    timer.cancel();
    return super.close();
  }

  // void setOtpRequest(OtpRequestKind otpRequestKind) {
  //   this.otpRequestKind = otpRequestKind;
  // }

  void requestOtp({bool? loading}) async {
    try {
      if (loading ?? true) {
        emit(OtpInProgress());
      }
      final res = await AuthProvider.requestOtp(phone: phone, email: email);
      if (res.statusCode.isSuccess) {
        emit(OtpRequested());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OtpError(error: e.toString()));
    }
  }

  void resendOtp({bool? loading}) async {
    startCountdownTimer();
    if (requestNew) {
      requestOtp();
    } else {
      //   startCountdownTimer();
      BlocProvider.of<UserCubit>(inheritedContext)
          .changePhoneAndEmail(inheritedContext, isSendAgain: true);
      emit(OtpRequested());
    }
  }

  void validateOtp(BuildContext context, {bool? loading}) {
    switch (otpRequestKind) {
      case OtpRequestKind.changeNumber:
        _validateChangeNumberOtp(context, loading: loading);
        break;
      default:
        _validateRegisterOtp(context, loading: loading);
    }
  }

  void _validateChangeNumberOtp(BuildContext context, {bool? loading}) async {
    Loader.show(context);
    try {
      if (loading ?? false) {
        emit(OtpInProgress());
      }
      final formattedPhone = phone;
      final result = await AccountProvider.validateOtpAndUpdatePhoneAndMail(
          email: email, phone: formattedPhone, otp: otp.valueOrNull);
      if (!result.isSuccess) {
        updateOtp('');
        //emit(OtpError());
        return;
      }

      await UserOperations.configureUserDataWhenLogin(
          accessToken: _prefs.accessToken!,
          refreshToken: _prefs.refreshToken!,
          email: email,
          phone: formattedPhone);
      Go.popTwice(context);
      Go.replace(outContext, Pager.changeNumber);
      emit(OtpSuccess(''));
      //
      //
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OtpError(error: e.toString()));
    } finally {
      updateOtp('');
      Loader.hide();
    }
  }

  void _validateRegisterOtp(BuildContext context, {bool? loading}) async {
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
