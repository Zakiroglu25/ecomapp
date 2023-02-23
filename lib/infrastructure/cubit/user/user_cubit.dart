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

  void changePhone(BuildContext context, {bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }
    try {
      final response = await AccountProvider.changePhone(
          phone: phone.valueOrNull, password: password.valueOrNull);
      final errors = response!.data;
      if (isSuccess(response.statusCode)) {
        emit(UserSuccess(response.data!));
        Snack.positive2(context, message: MyText.success);
      } else {
        Snack.showOverlay(context: context, message: errors);
        emit(UserFailed(response.statusCode.toString()));
      }
    } catch (e) {
      print(e);
    }
  }

  void update(BuildContext context, {bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }

    try {
      final response = await AccountProvider.updateUserInfo(
        phone: _prefs.user.phone,
        email: uEmail.valueOrNull,
        firstName: name.valueOrNull,
        lastName: lastname.valueOrNull,
        patronymic: patronymic.valueOrNull,
        birthday: birthDate.valueOrNull,
        finCode: fin.valueOrNull,
        idSerialNumber: seria.valueOrNull,
        // insuranceId: 1,
        newsletterSubscription: false,
      );

      if (isSuccess(response!.statusCode)) {
        await UserOperations.configUserDataWhenOpenApp(
          // fcmToken: _prefs.fcmToken,
          accessToken: _prefs.accessToken!, fcm: _prefs.fcmToken,
          //  path: _prefs.userPath
        );
        Snack.positive2(context, message: MyText.success);
        emit(UserSuccess(response.data!));
      } else {
        final errors = response.data;
        Snack.showOverlay(context: context, message: errors);
        emit(UserFailed(response.statusCode.toString()));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(UserFailed(MyText.error));
    }
  }

  void resetPassword(BuildContext context) async {
    try {
      final response = await AccountProvider.changePassword(
          oldPass: oldPassword.valueOrNull, newPass: newPassword.valueOrNull);
      final errors = response!.data;

      if (isSuccess(response.statusCode)) {
        emit(ChangeUserPassword());
        Snack.positive2(context, message: MyText.success);
      } else {
        Snack.showOverlay(context: context, message: "Yanlış şifrə");
        emit(ErrorChangeUserPassword(response.statusCode.toString()));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(UserFailed(MyText.error));
    }
  }

//change pass new password
  final BehaviorSubject<String> newPassword = BehaviorSubject<String>();

  Stream<String> get newPasswordStream => newPassword.stream;

  updateNewPassword(String value) {
    if (value.isEmpty) {
      newPassword.value = '';
      newPassword.sink.addError("Xana doldurulmalıdır");
    } else {
      newPassword.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isNewPasswordIncorrect =>
      (!newPassword.hasValue || newPassword.value.isEmpty);

//change pass old password
  final BehaviorSubject<String> oldPassword = BehaviorSubject<String>();

  Stream<String> get oldPasswordStream => oldPassword.stream;

  updateOldPassword(String value) {
    if (value.isEmpty) {
      oldPassword.value = '';
      oldPassword.sink.addError("Xana doldurulmalıdır");
    } else {
      oldPassword.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isOldPasswordIncorrect =>
      (!oldPassword.hasValue || oldPassword.value.isEmpty);

  //[password]
  final BehaviorSubject<String> password = BehaviorSubject<String>();

  Stream<String> get passwordStream => password.stream;

  updatePassword(String value) {
    if (value.isEmpty) {
      password.value = '';
      password.sink.addError("Xana doldurulmalıdır");
    } else {
      password.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isPasswordIncorrect =>
      (!password.hasValue || password.value.isEmpty);

  //phone
  final BehaviorSubject<String> phone = BehaviorSubject<String>();

  Stream<String> get phoneStream => phone.stream;

  updatePhone(String value) {
    if (value.isEmpty) {
      phone.value = '';
      phone.sink.addError("Xana doldurulmalıdır");
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
      birthDate.sink.addError("Xana doldurulmalıdır");
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
      fin.sink.addError("Xana doldurulmalıdır");
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
      name.sink.addError("Xana doldurulmalıdır");
    } else {
      name.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isNameIncorrect => (!name.hasValue || name.value.isEmpty);

  //lastname
  final BehaviorSubject<String> lastname = BehaviorSubject<String>();

  Stream<String> get lastnameStream => lastname.stream;

  updateLastname(String value) {
    if (value.isEmpty) {
      lastname.value = '';
      lastname.sink.addError("Xana doldurulmalıdır");
    } else {
      lastname.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isLastNameIncorrect =>
      (!lastname.hasValue || lastname.value.isEmpty);

  //fin
  final BehaviorSubject<String> seria = BehaviorSubject<String>();

  Stream<String> get seriaStream => seria.stream;

  updateSeria(String value) {
    if (value.isEmpty) {
      seria.value = '';
      seria.sink.addError("Xana doldurulmalıdır");
    } else {
      seria.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isSeriaIncorrect => (!seria.hasValue || seria.value.isEmpty);

  //patronymic
  final BehaviorSubject<String> patronymic = BehaviorSubject<String>();

  Stream<String> get patronymicStream => patronymic.stream;

  patronymicName(String value) {
    if (value.isEmpty) {
      patronymic.value = '';
      patronymic.sink.addError("Xana doldurulmalıdır");
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
            !isLastNameIncorrect &&
            !isSeriaIncorrect &&
            !isEmailIncorrect &&
            !isPatronymicIncorrect
        // !isPhoneIncorrect

        ) {
      emit(UserButtonActive());
      return true;
    } else {
      return false;
    }
  }
}
