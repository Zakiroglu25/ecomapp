import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:uikit/infrastructure/mixins/count_down_mixin.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/navigate_utils.dart';
import '../../config/recorder.dart';
import '../../data/insurance_provider.dart';
import 'insurance_otp_state.dart';
import 'mixin.dart';

class InsuranceOtpCubit extends Cubit<InsuranceOtpState>
    with InsuranceMixin, CountDownMixin {
  InsuranceOtpCubit() : super(InsuranceOtpInitial());

  String policy = '';

  void setPolicyNumber({required String policyNumber}) async {
    policy = policyNumber;
  }

  void validateInsurance(BuildContext context, {bool loading = true}) async {
    if (loading) {
      emit(InsuranceOtpLoading());
    }
    try {
      final response = await InsuranceProvider.validateInsurance(
          policyNumber: policy, otp: otp.valueOrNull);
      if (response.statusCode.isSuccess) {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        Go.replace(context, Pager.addInsuranceInfo);
      } else {
        clearOtp();
      }
    } catch (e, s) {
      clearOtp();
      // Go.pop(context);
      // Go.pop(context);
      // Go.pop(context);
      // Go.replace(context, Pager.addInsuranceInfo);
      Recorder.recordCatchError(e, s);
    } finally {
      emit(InsuranceOtpInitial());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
