import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final titleCnt = TextEditingController();
  final countryController = TextEditingController();
  final houseNumberController = TextEditingController();
  final streetNameController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final descriptionController = TextEditingController();
  final isMain = TextEditingController();

  void addAddress(BuildContext context, [bool loading = true]) async {
    try {
      if (loading) {
        print("Cubit1");
        emit(AddAddressInProgress());
        print("Cubit2");
        final result = await AddressProvider.addAddress(
            city: cityController.text,
            country: countryController.text,
            title: "titleCnttext",
            houseNumber: "houseNumberControllertext",
            streetName: streetNameController.text,
            phone: _prefs.user.phone,
            latitude: "43.000",
            longitude: "45.00",
            description: descriptionController.text,
            isMain: false);
        print("Cubit3");

        bbbb("resoooo: " + result.toString());
        if (isSuccess(result?.statusCode)) {
          print("Cubit4");
          emit(AddAddressSuccess());
        } else {
          print("Cubit5");
          emit(AddAddressError(error: MyText.error + " ${result!.statusCode}"));
        }
        emit(AddAddressInProgress());
      } else {
        emit(AddAddressError(error: MyText.all_fields_must_be_filled));
        print("Cubit6");
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AddAddressError(error: MyText.demo));
    } catch (e) {
      emit(AddAddressError());
    }
  }

  void editAddress(AddressModel address) async {
    try {
      print("Cubit1");
      emit(AddAddressInProgress());
      print("Cubit2");
      final result = await AddressProvider.addAddress(
          city: cityController.text,
          country: countryController.text,
          title: "titleCnttext",
          houseNumber: "houseNumberControllertext",
          streetName: streetNameController.text,
          phone: _prefs.user.phone,
          latitude: "43.000",
          longitude: "45.00",
          description: descriptionController.text,
          isMain: false);
      print("Cubit3");

      bbbb("resoooo: " + result.toString());
      if (isSuccess(result?.statusCode)) {
        print("Cubit4");
        emit(AddAddressEditSuccess());
      } else {
        print("Cubit5");
        emit(AddAddressError(error: MyText.error + " ${result!.statusCode}"));
      }
      emit(AddAddressInProgress());
    } on SocketException catch (_) {
      //network olacaq
      emit(AddAddressError(error: MyText.demo));
    } catch (e) {
      emit(AddAddressError());
    }
  }
}
