import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/app_operations.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/screen/snack.dart';
import '../../config/recorder.dart';
import '../../data/insurance_provider.dart';
import 'insurance_state.dart';
import 'mixin.dart';

class InsuranceCubit extends Cubit<InsuranceState> with InsuranceMixin {
  InsuranceCubit() : super(InsuranceInitial()){
 phoneNum = TextEditingController();
 policy = TextEditingController();
 finCodeController = TextEditingController();
  }
  late TextEditingController phoneNum = TextEditingController();
  late TextEditingController policy = TextEditingController();
  late TextEditingController finCodeController = TextEditingController();

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
    } catch (e,s) {
      Recorder.recordCatchError(e, s);
      emit(InsuranceError());
    }
  }

  void addInsurance(
      {bool loading = true, required BuildContext context}) async {
    if (loading) {
      emit(InsuranceLoading());
    }
    try {
      final number = AppOperations.formatNumberWith994(phoneNum.text);
      final response = await InsuranceProvider.addInsurance(
          policyNumber: policy.text,
          phoneNumber: number,
          finCode: finCodeController.text);
      final errors = response.data;
      if (response.statusCode.isSuccess) {
        // emit(AddInsuranceSuccess());
        // Snack.positive2(context, message: MyText.success);
        Go.to(context, Pager.validateInsurance(context, policyNumber: policy.text));
        emit(InsuranceInitial());
      } else {
        // Snack.showOverlay(context: context, message: errors);
        emit(InsuranceError(error: response.statusCode.toString()));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(InsuranceError(error: MyText.error));
    }
  }

  // void validateInsurance(BuildContext context, {bool loading = true}) async {
  //   if (loading) {
  //     emit(InsuranceLoading());
  //   }
  //   try {
  //     final response = await InsuranceProvider.validateInsurance(
  //         policyNumber: policy.text, otp: otp.valueOrNull);
  //     if (response.statusCode.isSuccess) {
  //       Go.pop(context);
  //       Go.pop(context);
  //       Go.pop(context);
  //       Go.replace(context, Pager.addInsuranceInfo);
  //     } else {
  //       clearOtp();
  //     }
  //   } catch (e, s) {
  //     clearOtp();
  //     Recorder.recordCatchError(e, s);
  //   }finally{
  //     emit(InsuranceInitial());
  //   }
  // }
  @override
  Future<void> close() {
    finCodeController.dispose();
    policy.dispose();
    phoneNum.dispose();
    bbbb("closed -- ");
    return super.close();
  }
}
