import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/data/public_provider.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/screen/snack.dart';
import '../../config/recorder.dart';
import '../../data/insurance_provider.dart';
import 'insurance_state.dart';

class InsuranceCubit extends Cubit<InsuranceState> {
  InsuranceCubit() : super(InsuranceInitial());

  getInsurance({bool loading = true}) async {
    if (loading) {
      emit(InsuranceProgress());
    }
    try {
      final result = await InsuranceProvider.getInsurance();
      if (isSuccess(result.statusCode)) {
        emit(InsuranceSuccess(result.data));
      } else {
        emit(InsuranceError());
      }
    } on SocketException catch (_) {
      emit(InsuranceError());
    } catch (e) {
      eeee("Product Option Error" + e.toString());
      emit(InsuranceError());
    }
  }

  void addInsurance(BuildContext context) async {
    try {
      print("Cubit1");
      final response = await InsuranceProvider.addInsurance(
          policyNumber: policyNumber.valueOrNull,
          phoneNumber: phoneNumber.valueOrNull);
      print("Cubit2");
      print(policyNumber.valueOrNull);
      print(phoneNumber.valueOrNull);
      final errors = response.data;
      print("Cubit3");
      if (isSuccess(response.statusCode)) {
        print("Cubit4");
        emit(AddInsuranceSuccess());
        Snack.positive(context: context, message: MyText.success);
      } else {
        print("Cubit5");
        Snack.display(message: errors);
        emit(InsuranceError(error: response.statusCode.toString()));
      }
    } catch (e, s) {
      print("Cubit6");
      Recorder.recordCatchError(e, s);
      emit(InsuranceError(error: MyText.error));
    }
  }

  //policyNumber
  final BehaviorSubject<String> policyNumber = BehaviorSubject<String>();

  Stream<String> get policyNumberStream => policyNumber.stream;

  updatePolicyNumber(String value) {
    if (value.isEmpty) {
      policyNumber.value = '';
      policyNumber.sink.addError("Xana doldurulmalıdır");
    } else {
      policyNumber.sink.add(value);
    }
    isInsuranceInfoValid();
  }

  bool get isPolicyNumberIncorrect =>
      (!policyNumber.hasValue || policyNumber.value.isEmpty);

//phone number
  final BehaviorSubject<String> phoneNumber = BehaviorSubject<String>();

  Stream<String> get phoneNumberStream => phoneNumber.stream;

  updatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneNumber.value = '';
      phoneNumber.sink.addError("Xana doldurulmalıdır");
    } else {
      phoneNumber.sink.add(value);
    }
    isInsuranceInfoValid();
  }

  bool get isPhoneNumberIncorrect =>
      (!phoneNumber.hasValue || phoneNumber.value.isEmpty);



  bool isInsuranceInfoValid() {
    if (!isPolicyNumberIncorrect &&
        !isPhoneNumberIncorrect

    ) {
      emit(InsuranceButtonActive());
      return true;
    } else {
      return false;
    }
  }
}