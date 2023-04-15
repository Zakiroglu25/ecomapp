import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/app_operations.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/screen/snack.dart';
import '../../../utils/validators/validator.dart';
import '../../data/auth_provider.dart';
import '../../services/hive_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  HiveService get _prefs => locator<HiveService>();
  void register(BuildContext context) {
    registerPersonal(context);
  }

  void registerPersonal(BuildContext context) async {
    emit(RegisterLoading());
    try {
      // final deviceCode = await _firebaseMessaging.getToken();
      final deviceCode = 'token';
      final formattedPhone =
          AppOperations.formatNumberWith994(phone.valueOrNull!);
      final response = await AuthProvider.registration(
        email: uEmail.valueOrNull,
        firstName: uName.valueOrNull,
        lastName: surName.valueOrNull,
        phone: formattedPhone,
        password: uPassMain.value,
        ads: checkbox.valueOrNull,
      );

      if (response!.status.isSuccess) {
        _prefs.persistPhone(phone: formattedPhone);
        // await UserOperations.configureUserDataWhenLogin(
        //   refreshToken: '',
        //   accessToken: response.toString(),
        //   path: uPassMain.valueOrNull,
        // );
        emit(RegisterSuccess(""));
        Snack.positive2(context, message: MyText.otpSent);
        Go.to(context, Pager.otp());
      } else {
        // String error = '';
        // response?.validation?.toJson().entries.map((e) {
        //   error = "${error} ," + '${e.key} : ${e.value}';
        // });
        emit(RegisterFailed(message: response.details));
      }
    } catch (e, s) {
      //emit(RegisterFailed(message: e.toString()));
      Recorder.recordCatchError(e, s);
    }
  }

  /////////////////////////////////////////////////////////////
  /////////////////  v a l u e s /////////////////////////////
  ///////////////////////////////////////////////////////////

  //name
  //name
  final BehaviorSubject<String> uName = BehaviorSubject<String>();

  Stream<String> get nameStream => uName.stream;

  updateName(String value) {
    if (value == null || value.isEmpty) {
      uName.value = '';
      uName.sink.addError(MyText.field_is_not_correct);
    } else {
      uName.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isNameIncorrect =>
      (!uName.hasValue || uName.value == null || uName.value.isEmpty);

  //surname
  final BehaviorSubject<String> surName = BehaviorSubject<String>();

  Stream<String> get surnameStream => surName.stream;

  updateSurName(String value) {
    if (value == null || value.isEmpty) {
      surName.value = '';
      surName.sink.addError(MyText.field_is_not_correct);
    } else {
      surName.sink.add(value);
    }
    isUserInfoValid();
  }

  bool get isSurNameIncorrect =>
      (!surName.hasValue || surName.value == null || surName.value.isEmpty);

  //registerActive
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
    isUserInfoValid();
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
    isUserInfoValid();
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
    isUserInfoValid();
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
    isUserInfoValid();
  }

  inverseCheckBox() {
    checkbox.sink.add(!checkbox.value);
    //}
    isUserInfoValid();
  }

  bool get isCheckBoxIncorrect =>
      (!checkbox.hasValue || checkbox.value == null || checkbox.value == false);

  //checkbox ads
  final BehaviorSubject<bool> checkboxAds = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxAdsStream => checkboxAds.stream;

  updateCheckBoxAds(bool value) {
    checkboxAds.sink.add(value);
    //}
    isUserInfoValid();
  }

  bool get isCheckBoxAdsIncorrect => (!checkboxAds.hasValue ||
      checkboxAds.value == null ||
      checkboxAds.value == false);

  //gender

  bool isUserInfoValid() {
    if (!isEmailIncorrect &&
        !isMainPassInCorrect &&
        !isCheckBoxIncorrect &&
        //!isCheckBoxAdsIncorrect &&
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
