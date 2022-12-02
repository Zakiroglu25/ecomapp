import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/request_control.dart';
import '../../config/recorder.dart';
import '../../data/address_provider.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(AddressInProgress());
    }
    try {
      final result = await AddressProvider.getAddresses();
      emit(AddressSuccess(result));
    } on SocketException catch (_) {
      emit(AddressNetworkError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(AddressError(error: e.toString()));
    }
  }

  void delete(String? id, {bool loading = true}) async {
    if (loading) {
      emit(AddressInProgress());
    }

    try {
      final result = await AddressProvider.delete(guid: "$id");

      if (isSuccess(result!.statusCode)) {
        emit(AddressDelete());
        fetch(false);
      } else {
        emit(AddressError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AddressNetworkError());
    } catch (e) {
      emit(AddressError(error: MyText.error + " " + e.toString()));
    }

    //user/attorneys/delete
  }
}
