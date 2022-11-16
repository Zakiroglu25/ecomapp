import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/delegate/string_operations.dart';
import '../../data/address_provider.dart';
import 'add_and_updtae_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());

  void addAddress(BuildContext context, [bool loading = true]) async {
    try {
      if (loading) {
        emit(AddAddressInProgress());
        final result = await AddressProvider.addAddress(
            title: title.valueOrNull,
            houseNumber: houseNumber.valueOrNull,
            streetName: '',
            city: '',
            country: '',
            phone: '',
            latitude: '',
            longitude: '',
            description: '',
            isMain: null);

        bbbb("resoooo: " + result.toString());
        if (isSuccess(result?.statusCode)) {
          emit(AddAddressSuccess());
        } else {
          emit(AddAddressError(error: MyText.error + " ${result!.statusCode}"));
        }
        emit(AddAddressInProgress());
      } else {
        emit(AddAddressError(error: MyText.all_fields_must_be_filled));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AddAddressError(error: MyText.demo));
    } catch (e) {
      emit(AddAddressError());
    }
  }

  //region
  final BehaviorSubject<String> region = BehaviorSubject<String>();

  Stream<String> get regionStream => region.stream;

  updateRegion(String value) {
    if (value == null || value.isEmpty) {
      region.value = '';
      region.sink.addError(MyText.field_is_not_correct);
    } else {
      region.sink.add(value);
    }
  }

  bool get isRegionIncorrect =>
      (!region.hasValue || region.value == null || region.value.isEmpty);

//title
  final BehaviorSubject<String> title = BehaviorSubject<String>();

  Stream<String> get titleStream => title.stream;

  updateTitle(String value) {
    if (value == null || value.isEmpty) {
      title.value = '';
      title.sink.addError(MyText.field_is_not_correct);
    } else {
      title.sink.add(value);
    }
  }

  bool get isTitleIncorrect =>
      (!title.hasValue || title.value == null || title.value.isEmpty);

//houseNumber
  final BehaviorSubject<String> houseNumber = BehaviorSubject<String>();

  Stream<String> get houseNumberStream => houseNumber.stream;

  updateHouseNumber(String value) {
    if (value == null || value.isEmpty) {
      houseNumber.value = '';
      houseNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      houseNumber.sink.add(value);
    }
  }

  bool get isHouseNumberIncorrect => (!houseNumber.hasValue ||
      houseNumber.value == null ||
      houseNumber.value.isEmpty);
}
