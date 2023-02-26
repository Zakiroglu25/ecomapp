import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/screen/snack.dart';
import '../../data/address_provider.dart';
import '../../model/response/address_model.dart';
import '../../services/hive_service.dart';
import 'add_and_updtae_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());

  HiveService get _prefs => locator<HiveService>();
  double? lat;
  double? long;

  void setAddress({BuildContext? context, Address? address}) async {
    try {
      emit(AddAddressInProgress());

      if (address.isNotNull) {
        updateStreet(address?.streetName);
        updateDesc(address?.description);
        updateCity(address?.city);
        updateCountry(address?.country);
        updateLatLong(double.tryParse(address?.latitude ?? '0'),
            double.tryParse(address?.longitude ?? '0'));
        updateTitle(address?.title);
      }
    } catch (e, s) {
      emit(AddAddressError());
      Recorder.recordCatchError(e, s);
    }
  }

  void addAddress({
    BuildContext? context,
  }) async {
    try {
      emit(AddAddressInProgress());

      final result = await AddressProvider.addAddress(
          city: city.valueOrNull,
          country: country.valueOrNull,
          title: title.valueOrNull,
          houseNumber: "12",
          streetName: street.valueOrNull ?? '',
          phone: _prefs.user.phone,
          latitude: lat,
          longitude: long,
          description: desc.valueOrNull,
          isMain: false);

      if (result.statusCode.isSuccess) {
        emit(AddAddressSuccess());
      } else {
        emit(AddAddressError(error: MyText.error + " ${result.statusCode}"));
      }
      emit(AddAddressInProgress());
    } catch (e, s) {
      emit(AddAddressError());
      Recorder.recordCatchError(e, s);
    }
  }

  void editAddress(
      {required String guid, required BuildContext context}) async {
    try {
      emit(AddAddressInProgress());
      final result = await AddressProvider.editAddress(
          city: city.valueOrNull,
          country: country.valueOrNull,
          title: title.valueOrNull,
          houseNumber: "12",
          streetName: street.valueOrNull,
          phone: _prefs.user.phone,
          latitude: lat,
          longitude: long,
          description: desc.valueOrNull,
          isMain: false,
          guid: guid);

      if (result.statusCode.isSuccess) {
        emit(AddAddressEditSuccess());
        Go.pop(context);
        Snack.positive2(context);
      } else {
        //emit(AddAddressError(error: MyText.error + " ${result.statusCode}"));
      }
      //  emit(AddAddressInProgress());
    } catch (e, s) {
      emit(AddAddressError());
      Recorder.recordCatchError(e, s);
    }
  }

//values
//title
  final BehaviorSubject<String> title = BehaviorSubject<String>();

  Stream<String> get titleStream => title.stream;

  updateTitle(String? value) {
    if (value == null || value.isEmpty) {
      title.value = '';
      title.sink.addError(MyText.field_is_not_correct);
    } else {
      title.sink.add(value);
    }
    isAddressValid();
  }

  bool get isTitleIncorrect =>
      (!title.hasValue || title.value == null || title.value.isEmpty);

//desc
  final BehaviorSubject<String> desc = BehaviorSubject<String>();

  Stream<String> get descStream => desc.stream;

  updateDesc(String? value) {
    if (value == null || value.isEmpty) {
      desc.value = '';
      desc.sink.addError(MyText.field_is_not_correct);
    } else {
      desc.sink.add(value);
    }
    isAddressValid();
  }

  bool get isDescIncorrect =>
      (!desc.hasValue || desc.value == null || desc.value.isEmpty);

//city
  final BehaviorSubject<String> city = BehaviorSubject<String>();

  Stream<String> get cityStream => city.stream;

  updateCity(String? value) {
    if (value == null || value.isEmpty) {
      city.value = '';
      city.sink.addError(MyText.field_is_not_correct);
    } else {
      city.sink.add(value);
    }
    isAddressValid();
  }

  bool get isCityIncorrect =>
      (!city.hasValue || city.value == null || city.value.isEmpty);

//country
  final BehaviorSubject<String> country = BehaviorSubject<String>();

  Stream<String> get countryStream => country.stream;

  updateCountry(String? value) {
    if (value == null || value.isEmpty) {
      country.value = '';
      country.sink.addError(MyText.field_is_not_correct);
    } else {
      country.sink.add(value);
    }
    isAddressValid();
  }

  bool get isCountryIncorrect =>
      (!country.hasValue || country.value == null || country.value.isEmpty);

  // lat - long
  updateLatLong(double? lat, double? long) {
    if (lat.isNull || long.isNull) {
    } else {
      this.lat = lat;
      this.long = long;
    }
    // isAddressValid();
  }

  //street name
  final BehaviorSubject<String> street = BehaviorSubject<String>();

  Stream<String> get streetStream => street.stream;

  updateStreet(String? value) {
    if (value == null || value.isEmpty) {
      street.value = '';
      street.sink.addError(MyText.field_is_not_correct);
    } else {
      street.sink.add(value);
    }
    isAddressValid();
  }

  bool get isStreetIncorrect =>
      (!street.hasValue || street.value == null || street.value.isEmpty);

  final BehaviorSubject<bool> addressActive =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get addressActiveStream => addressActive.stream;

  updateActive(bool value) {
    addressActive.sink.add(value);
  }

  bool isAddressValid() {
    if (!isCountryIncorrect &&
        !isCityIncorrect &&
        !isTitleIncorrect &&
        !isDescIncorrect) {
      updateActive(true);
      emit(UserButtonActive());

      //bbbb("---- true");
      return true;
    } else {
      updateActive(false);

      //bbbb("---- false");
      return false;
    }
  }
}
