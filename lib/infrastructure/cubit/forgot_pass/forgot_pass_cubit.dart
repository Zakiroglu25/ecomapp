// Dart imports:
// Package imports:

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/services/navigation_service.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/app_operations.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/screen/snack.dart';
import '../../../utils/validators/validator.dart';
import '../../data/forgot_provider.dart';
import '../../services/hive_service.dart';
import 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  ForgotPassCubit() : super(ForgotPassEnterMail());

  HiveService get _prefs => locator<HiveService>();
  String buttonText = MyText.send;
  String tempToken = '';
  final context = NavigationService.instance.navigationKey?.currentContext;

  void changeState(
      {bool loading = true,
      int? index,
      bool back = false,
      required BuildContext context}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    final goOn = await operate(currentIndex, context);
    if (!back) {
      if (goOn) currentIndex = index ?? currentIndex + 1;
    } else {
      currentIndex = currentIndex > 0 ? currentIndex - 1 : currentIndex;
    }
    emit(states[index ?? currentIndex]);
  }

  Future<bool> requestOTP(BuildContext context, {bool loading = true}) async {
    final result = await ForgotProvider.requestOTP(
        phone: AppOperations.formatNumberWith994(phone.valueOrNull!));
    if (result!.statusCode.isSuccess) {
      return true;
    } else {
      emit(ForgotPassError());
      if (result.data.toString().contains('message')) {
        Snack.showOverlay(context: context, message: result.data['message']);
      }

      return false;
    }
  }

  Future<bool> validateOTP(BuildContext context, {bool loading = true}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }
    final result = await ForgotProvider.validateOTP(
        phone: AppOperations.formatNumberWith994(phone.valueOrNull!),
        code: otpCode.valueOrNull);

    if (result!.statusCode.isSuccess) {
      tempToken = result.data;
      return true;
    } else {
      emit(ForgotPassError());
      Snack.showOverlay(context: context, message: MyText.error);
      return false;
    }
  }

  Future<bool> confirmPass(BuildContext context, {bool loading = true}) async {
    if (loading) {
      emit(ForgotPassInProgress());
    }

    if (uPassMain.valueOrNull != uPassSecond.valueOrNull) {
      Snack.error(context: context, message: MyText.bothOfPassMustBeSame);
      return false;
    }
    final result = await ForgotProvider.resetPass(
        token: tempToken, newPass: uPassMain.valueOrNull);

    if (result!.statusCode.isSuccess) {
      //tempToken = result.data;
      return true;
    } else {
      emit(ForgotPassError());
      Snack.error(context: context);
      return false;
    }
    currentIndex = 2;
    emit(ForgotPassSuccess());
  }

  Future<bool> operate(int currentIndex, BuildContext context) async {
    bool res = false;
    switch (currentIndex) {
      case 0:
        buttonText = MyText.send;
        res = await requestOTP(context);
        break;
      //return res;
      case 1:
        buttonText = MyText.goOn;
        res = await validateOTP(context);
        return res;
      //break;
      case 2:
        res = await confirmPass(context);
        buttonText = MyText.login;
        break;
      case 3:
        buttonText = MyText.login;
        Go.andRemove(context, Pager.app());
        break;
    }

    return res;
  }

  ////////values////////////////////////////////////////////////////////////////////
  ////////values////////////////////////////////////////////////////////////////////
  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value == null || value.isEmpty) {
      phone.value = '';
      phone.sink.addError(MyText.field_is_not_correct);
    } else {
      phone.sink.add(value);
    }
    //isUserInfoValid(registerType: _registerType);
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  ///////uEmail
  bool emailValid = false;
  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  updateEmail(String value) {
    if (value == null || value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError(MyText.field_is_not_correct);
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
  }

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

  ///////uCode
  final BehaviorSubject<String> otpCode = BehaviorSubject<String>();

  Stream<String> get codeStream => otpCode.stream;

  updateCode(String value) {
    if (value == null || value.isEmpty) {
      otpCode.value = '';
      otpCode.sink.addError(MyText.field_is_not_correct);
    } else {
      otpCode.sink.add(value);
    }
  }

  bool get isCodeIncorrect =>
      (!otpCode.hasValue || otpCode.value == null || otpCode.value.isEmpty);

  ///////uMainPass
  final BehaviorSubject<String> uPassMain = BehaviorSubject<String>();

  Stream<String> get passMainStream => uPassMain.stream;

  updateMainPass(String value) {
    if (value == null || value.isEmpty) {
      uPassMain.value = '';
      uPassMain.sink.addError(MyText.field_is_not_correct);
    } else {
      uPassMain.sink.add(value);
    }
  }

  bool get isMainPassCorrect => (!uPassMain.hasValue ||
      uPassMain.value == null ||
      uPassMain.value.isEmpty);

  ///////uSecondPass
  final BehaviorSubject<String> uPassSecond = BehaviorSubject<String>();

  Stream<String> get passSecondStream => uPassSecond.stream;

  updateSecondPass(String value) {
    if (value == null || value.isEmpty) {
      uPassSecond.value = '';
      uPassSecond.sink.addError(MyText.field_is_not_correct);
    } else {
      uPassSecond.sink.add(value);
    }
  }

  bool get isSecondPassCorrect => (!uPassSecond.hasValue ||
      uPassSecond.value == null ||
      uPassSecond.value.isEmpty ||
      uPassSecond.value != uPassMain.value);

  @override
  Future<void> close() {
    uEmail.close();
    otpCode.close();
    uPassSecond.close();
    uPassMain.close();
    return super.close();
  }

  int currentIndex = 0;

  List states = [
    ForgotPassEnterMail(),
    ForgotPassEnterCode(),
    ForgotPassChange(),
    ForgotPassSuccess(),
    // ForgotPassNewPass(),
    // ForgotPassSuccess()
  ];
}
