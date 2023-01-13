import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:uikit/infrastructure/data/public_provider.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
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

}
