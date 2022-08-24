import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../../../locator.dart';
import '../../../util/constants/text.dart';
import '../../../util/delegate/my_printer.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/delegate/pager.dart';
import '../../../util/delegate/request_control.dart';
import '../../../util/delegate/user_operations.dart';
import '../../../util/validators/validator.dart';
import '../../data/auth_provider.dart';
import '../../services/hive_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  HiveService get _prefs => locator<HiveService>();

  void register(BuildContext context) {
    registerPersonal(context);
    iiii("register cuit 1");
  }

  void registerPersonal(BuildContext context) async {
    emit(RegisterLoading());
    iiii("register cuit 2");
    try {
      // final deviceCode = await _firebaseMessaging.getToken();
      iiii("register cuit 3");
      final response = await AuthProvider.registrationPersonal(
          email: uEmail.valueOrNull,
          phone: phone.valueOrNull,
          password: uPassMain.value);
      iiii(uEmail.toString()+phone.toString()+uPassMain.toString());

      iiii("register cubit bloc result: " + response.toString());

      if (isSuccess(response?.statusCode)) {
        await UserOperations.configureUserDataWhenLogin(
            accessToken: response?.data, path: uPassMain.valueOrNull);
        Go.andRemove(context, Pager.app(showSplash: true));
        emit(RegisterSuccess(''));
      } else {
        emit(RegisterFailed(message: "Qeydiyyat Zamani xeta yarandi"));
      }
    } catch (e, s) {
      print("register cubit -> registrationPersonal ->catch : $e=> $s");
      emit(RegisterFailed(message: e.toString()));
    }
  }

  //////VALUES///////////VALUES//////////VALUES/////////////VALUES///////////////////

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

  bool get isMainPassInCorrect => (!uPassMain.hasValue ||
      uPassMain.value == null ||
      uPassMain.value.isEmpty);

  //checkbox security
  final BehaviorSubject<bool> checkbox = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxStream => checkbox.stream;

  updateCheckBox(bool value) {
    // if (value) {
    //   checkbox.value = false;
    //   checkbox.sink.addError(MyText.field_is_not_correct);
    // } else {
    checkbox.sink.add(value);
    //}
  }

  bool get isCheckBoxIncorrect =>
      (!checkboxAds.hasValue || checkboxAds.value == null || checkboxAds.value == false);

  //checkbox ads
  final BehaviorSubject<bool> checkboxAds = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxAdsStream => checkboxAds.stream;

  updateCheckBoxAds(bool value) {
    // if (value) {
    //   checkbox.value = false;
    //   checkbox.sink.addError(MyText.field_is_not_correct);
    // } else {
    checkboxAds.sink.add(value);
    //}
  }

  bool get isCheckBoxAdsIncorrect =>
      (!checkbox.hasValue || checkbox.value == null || checkbox.value == false);

  //gender

  @override
  Future<void> close() {
    uEmail.close();
    uPassMain.close();
    checkbox.close();
    phone.close();
    return super.close();
  }

//eslinde asagidaki regidster type funksiyada gondermeye ehtiyac yoxdu
}
