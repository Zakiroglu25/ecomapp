import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/address_provider.dart';
import '../../model/response/address_model.dart';
import '../../services/hive_service.dart';
import 'add_and_updtae_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());

  HiveService get _prefs => locator<HiveService>();

  void addAddress({
    double? lat,
    double? lng,
    BuildContext? context,
  }) async {
    try {
      emit(AddAddressInProgress());

      final result = await AddressProvider.addAddress(
          city: city.valueOrNull,
          country: country.valueOrNull,
          title: title.valueOrNull,
          houseNumber: "12",
          streetName: street.valueOrNull,
          phone: _prefs.user.phone,
          latitude: lat.toString(),
          longitude: lng.toString(),
          description: desc.valueOrNull,
          isMain: false);

      if (result.statusCode.isSuccess) {
        emit(AddAddressSuccess());
      } else {
        emit(AddAddressError(error: MyText.error + " ${result.statusCode}"));
      }
      emit(AddAddressInProgress());
    } on SocketException catch (_) {
      //network olacaq
      emit(AddAddressError(error: MyText.demo));
    } catch (e) {
      emit(AddAddressError());
    }
  }

  void editAddress(
      {Address? address,
      double? lat,
      String? guid,
      double? lng,
      BuildContext? context,
      TextEditingController? streetNameController}) async {
    try {
      emit(AddAddressInProgress());
      final result = await AddressProvider.editAddress(
          city: city.valueOrNull,
          country: "Azərbaycan",
          title: title.valueOrNull,
          houseNumber: "12",
          streetName: street.valueOrNull,
          phone: _prefs.user.phone,
          latitude: lat.toString(),
          longitude: lng.toString(),
          description: desc.valueOrNull,
          isMain: false,
          guid: guid.toString());

      if (isSuccess(result.statusCode)) {
        emit(AddAddressEditSuccess());
      } else {
        emit(AddAddressError(error: MyText.error + " ${result.statusCode}"));
      }
      emit(AddAddressInProgress());
    } on SocketException catch (_) {
      //network olacaq
      emit(AddAddressError(error: MyText.demo));
    } catch (e) {
      emit(AddAddressError());
    }
  }

//values
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
    isAddressValid();
  }

  bool get isTitleIncorrect =>
      (!title.hasValue || title.value == null || title.value.isEmpty);

//desc
  final BehaviorSubject<String> desc = BehaviorSubject<String>();

  Stream<String> get descStream => desc.stream;

  updateDesc(String value) {
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

  updateCityc(String value) {
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

  updateCountry(String value) {
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

  //street name
  final BehaviorSubject<String> street = BehaviorSubject<String>();

  Stream<String> get streetStream => country.stream;

  updateStreet(String value) {
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
