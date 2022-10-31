import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../../utils/screen/snack.dart';
import '../../../utils/validators/validator.dart';
import '../../data/auth_provider.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(BuildContext context) {
    registerPersonal(context);
  }

  void registerPersonal(BuildContext context) async {
    emit(RegisterLoading());
    try {
      // final deviceCode = await _firebaseMessaging.getToken();
      final deviceCode = 'token';
      final response = await AuthProvider.registration(
        email: uEmail.valueOrNull,
        phone: phone.valueOrNull,
        password: uPassMain.value,
        ads: checkbox.valueOrNull,
      );

      if (response == 200) {
        await UserOperations.configureUserDataWhenLogin(
          refreshToken: '',
          accessToken: response.toString(),
          path: uPassMain.valueOrNull,
        );
        emit(RegisterSuccess(""));
        Snack.display(context: context, message: "Qeydiyyat Uğurla tamamlandı");
        Go.to(context, Pager.login);
      } else {
        emit(RegisterFailed(message: response!.message));
      }
    } catch (e, s) {
      print("register cubit -> registrationPersonal ->catch : $e=> $s");
      emit(RegisterFailed(message: e.toString()));
    }
  }

  final BehaviorSubject<bool> registerActive =
      BehaviorSubject<bool>.seeded(false);

//
  Stream<bool> get registerActiveeStream => registerActive.stream;

  bool get emailIsCorrect =>
      (!uEmail.hasValue || uEmail.value == null || uEmail.value.isEmpty);

  updateRegisterActivee(bool value) {
    registerActive.sink.add(value);
  }

  //
  //email
  bool emailValid = false;
  final BehaviorSubject<String> uEmail = BehaviorSubject<String>();

  Stream<String> get emailStream => uEmail.stream;

  updateEmail(String value) {
    if (value == null || value.isEmpty) {
      uEmail.value = '';
      uEmail.sink.addError("email_address_is_not_correct");
    } else {
      emailValid = Validator.mail(value);
      uEmail.sink.add(value);
    }
  }

  bool get isEmailIncorrect => (!uEmail.hasValue ||
      uEmail.value == null ||
      uEmail.value.isEmpty ||
      !emailValid);

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
  }

  bool get isPhoneIncorrect =>
      (!phone.hasValue || phone.value == null || phone.value.isEmpty);

  //Pass
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

  bool get isMainPassInCorrect => (!uPassMain.hasValue ||
      uPassMain.value == null ||
      uPassMain.value.isEmpty);

  //checkbox security
  final BehaviorSubject<bool> checkbox = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxStream => checkbox.stream;

  updateCheckBox(bool value) {
    checkbox.sink.add(value);
    //}
  }

  bool get isCheckBoxIncorrect => (!checkboxAds.hasValue ||
      checkboxAds.value == null ||
      checkboxAds.value == false);

  //checkbox ads
  final BehaviorSubject<bool> checkboxAds = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxAdsStream => checkboxAds.stream;

  updateCheckBoxAds(bool value) {
    checkboxAds.sink.add(value);
    //}
  }

  bool get isCheckBoxAdsIncorrect =>
      (!checkbox.hasValue || checkbox.value == null || checkbox.value == false);

  //gender

  bool isUserInfoValid() {
    if (!isEmailIncorrect &&
        !isMainPassInCorrect &&
        !isCheckBoxIncorrect &&
        !isEmailIncorrect &&
        !isPhoneIncorrect) {
      //  emit(RegisterButtonActive());
      updateRegisterActivee(true);
      //   bbbb("---- true 4");
      return true;
    } else {
      updateRegisterActivee(false);
      //bbbb("---- false 3");
      return false;
    }
  }

  @override
  Future<void> close() {
    uEmail.close();
    uPassMain.close();
    checkbox.close();
    phone.close();
    return super.close();
  }
}
