// Dart imports:
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/data/auth_provider.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/validators/validator.dart';
import '../../config/recorder.dart';
import 'otp_state.dart';

// Project imports:

class OTPCubit extends Cubit<OtpState> {
  OTPCubit({required this.phone}) : super(OtpInitial());

  bool emailValid = false;

  final String phone;

  final BehaviorSubject<String> otp = BehaviorSubject<String>();

  Stream<String> get otpStream => otp.stream;

  updateOtp(String value) {
    if (value == null || value.isEmpty) {
      otp.value = '';
      otp.sink.addError(MyText.field_is_not_correct);
    } else {
      otp.sink.add(value);
    }
  }

  bool get isOtpIncorrect =>
      (!otp.hasValue || otp.value == null || otp.value.isEmpty);

  @override
  Future<void> close() {
    otp.close();
    return super.close();
  }

  void requestOtp(BuildContext context, {bool? loading}) async {
    try {
      if (loading ?? true) {
        emit(OtpInProgress());
      }
      //
      //
      //
    } on SocketException catch (_) {
      emit(OtpError(error: 'network_error'));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OtpError(error: e.toString()));
    }
  }

  void validateOtp(String phone, {bool? loading}) async {
    try {
      if (loading ?? true) {
        emit(OtpInProgress());
      }
      //
      final res =
          await AuthProvider.validateOtp(phone: phone, otp: otp.valueOrNull);
      if (res.statusCode.isSuccess) {}
      //
      //
    } on SocketException catch (_) {
      emit(OtpError(error: MyText.networkError));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OtpError(error: e.toString()));
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
