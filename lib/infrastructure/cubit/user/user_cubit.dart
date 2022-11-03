import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../../utils/screen/snack.dart';
import '../../../utils/validators/validator.dart';
import '../../config/recorder.dart';
import '../../data/account_provider.dart';
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
          fcm: _prefs.fcmToken
          //  path: _prefs.userPath
          );
    } catch (e, s) {
      eeee(e.toString());
    }
  }

  void update(BuildContext context, {bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }
    try {
      final response = await AccountProvider.updateUserInfo(
        name: name.valueOrNull,
        email: uEmail.valueOrNull,
        patronymic: patronymic.valueOrNull,
        phone: phone.valueOrNull,
        birthday: birthDate.valueOrNull,
        finCode: fin.valueOrNull,
        insuranceId: null,
        newsletterSubscription: false,
      );

      if (isSuccess(response!.statusCode)) {
        await UserOperations.configUserDataWhenOpenApp(
          // fcmToken: _prefs.fcmToken,
          accessToken: _prefs.accessToken!, fcm: _prefs.fcmToken,
          //  path: _prefs.userPath
        );
        Snack.positive(context: context, message: MyText.operationIsSuccess);
        emit(UserSuccess(response.data!));
      } else {
        final errors = response.data;
        Snack.display(context: context, message: errors);
        emit(UserFailed(response.statusCode.toString()));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(UserFailed(MyText.error));
    }
  }

  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value.isEmpty) {
      phone.value = '';
      phone.sink.addError("field_is_not_correct");
    } else {
      phone.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isPhoneIncorrect => (!phone.hasValue || phone.value.isEmpty);

//email
  bool emailValid = false;
  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  updateEmail(String value) {
    if (value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError(MyText.emailAddressIsNotCorrect);
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isEmailIncorrect =>
      (!uEmail.hasValue || uEmail.value.isEmpty || !emailValid);

  //birthDate
  final BehaviorSubject<String> birthDate = BehaviorSubject<String>();

  Stream<String> get birthDateStream => birthDate.stream;

  updateBirthDate(String value) {
    if (value.isEmpty) {
      birthDate.value = '';
      birthDate.sink.addError("field_is_not_correct");
    } else {
      birthDate.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isBirthDateIncorrect =>
      (!birthDate.hasValue || birthDate.value.isEmpty);

  //fin
  final BehaviorSubject<String> fin = BehaviorSubject<String>();

  Stream<String> get finStream => fin.stream;

  updateFin(String value) {
    if (value.isEmpty) {
      fin.value = '';
      fin.sink.addError("field_is_not_correct");
    } else {
      fin.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isFinIncorrect => (!fin.hasValue || fin.value.isEmpty);

//name
  final BehaviorSubject<String> name = BehaviorSubject<String>();

  Stream<String> get nameStream => name.stream;

  updateName(String value) {
    if (value.isEmpty) {
      name.value = '';
      name.sink.addError("field_is_not_correct");
    } else {
      name.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isNameIncorrect => (!name.hasValue || name.value.isEmpty);

  //patronymic
  final BehaviorSubject<String> patronymic = BehaviorSubject<String>();

  Stream<String> get patronymicStream => patronymic.stream;

  patronymicName(String value) {
    if (value.isEmpty) {
      patronymic.value = '';
      patronymic.sink.addError("field_is_not_correct");
    } else {
      patronymic.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isPatronymicIncorrect =>
      (!patronymic.hasValue || patronymic.value.isEmpty);

  bool isUserInfoValid() {
    if (!isBirthDateIncorrect &&
        !isFinIncorrect &&
        !isNameIncorrect &&
        !isEmailIncorrect &&
        !isPatronymicIncorrect &&
        !isPhoneIncorrect) {
      emit(UserButtonActive());
      return true;
    } else {
      return false;
    }
  }
}
