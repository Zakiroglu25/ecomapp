import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/screen/snack.dart';
import '../../config/recorder.dart';
import '../../data/insurance_provider.dart';
import 'insurance_state.dart';

class InsuranceCubit extends Cubit<InsuranceState> {
  InsuranceCubit() : super(InsuranceInitial());
  final phoneNum = TextEditingController();
  final policy = TextEditingController();
  final finCode = TextEditingController();

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

  void addInsurance(
      {bool loading = true, required BuildContext context}) async {
    if (loading) {
      emit(InsuranceLoading());
    }
    try {
      final response = await InsuranceProvider.addInsurance(
          policyNumber: policy.text,
          phoneNumber: phoneNum.text,
          finCode: finCode.text);
      final errors = response.data;
      if (isSuccess(response.statusCode)) {
        emit(AddInsuranceSuccess());
        Snack.positive2(context, message: MyText.success);
      } else {
        Snack.showOverlay(context: context, message: errors);
        emit(InsuranceError(error: response.statusCode.toString()));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(InsuranceError(error: MyText.error));
    }
  }
}
