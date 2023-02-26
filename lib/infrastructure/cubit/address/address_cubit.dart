import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/screen/overlay_loader.dart';

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
      List<Address> result = await AddressProvider.getAddresses();
      emit(AddressSuccess(result));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(AddressError(error: e.toString()));
    }
  }

  void fetchMainAddress([bool loading = true]) async {
    if (loading) {
      emit(AddressInProgress());
    }
    try {
      List<Address> result = await AddressProvider.getAddresses();
      final address =
          result.where((element) => element.isMain == true).firstOrNull;
      emit(AddressMainSuccess(address));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(AddressError(error: e.toString()));
    }
  }

  void delete(String? id,
      {bool loading = true, required BuildContext context}) async {
    if (loading) {
      emit(AddressInProgress());
    }
    Loader.show(context);

    try {
      final result = await AddressProvider.delete(guid: "$id");

      if (result!.statusCode.isSuccess) {
        //emit(AddressDelete());
        fetch(false);
      } else {
        //emit(AddressError(error: MyText.error));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      //emit(AddressError(error: MyText.error + " " + e.toString()));
    } finally {
      Loader.hide();
    }
  }

  void update(String? id,
      {bool loading = true, required Address address}) async {
    if (loading) {
      emit(AddressInProgress());
    }

    try {
      final result =
          await AddressProvider.update(guid: "$id", address: address);

      if (isSuccess(result!.statusCode)) {
        emit(AddressDelete());
        fetch(false);
      } else {
        emit(AddressError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AddressNetworkError());
    } catch (e, s) {
      emit(AddressError(error: MyText.error + " " + e.toString()));
    }

    //user/attorneys/delete
  }

  @override
  emit(AddressState state) {
    if (!isClosed) return super.emit(state);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
