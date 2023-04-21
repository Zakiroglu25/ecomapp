import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/constants/text.dart';

mixin InsuranceMixin {
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

  clearOtp() {
    otp.sink.add('');
    otpController.text = '';
  }
}
