import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final titleCnt = TextEditingController()..addListener(() {});
  final countryController = TextEditingController();
  final houseNumberController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final descriptionController = TextEditingController();
  final isMain = TextEditingController();

  void addAddress(
      {double? lat,
      double? lng,
      BuildContext? context,
      TextEditingController? streetNameController}) async {
    try {
      emit(AddAddressInProgress());


      final result = await AddressProvider.addAddress(
          city: cityController.text,
          country: "Azərbaycan",
          title: titleCnt.text,
          houseNumber: "12",
          streetName: streetNameController!.text,
          phone: _prefs.user.phone,
          latitude: lat.toString(),
          longitude: lng.toString(),
          description: descriptionController.text,
          isMain: false);
      print("Cubit3");

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

  void editAddress({Address? address,double? lat,
      double? lng,
      BuildContext? context,
      TextEditingController? streetNameController}) async {
    try {
      emit(AddAddressInProgress());
      final result = await AddressProvider.addAddress(
          city: cityController.text,
          country: countryController.text,
          title: titleCnt.text,
          houseNumber: "12",
          streetName: streetNameController!.text,
          phone: _prefs.user.phone,
          latitude: lat.toString(),
          longitude: lng.toString(),
          description: descriptionController.text,
          isMain: false);
      print("Cubit3");

      bbbb("resoooo: " + result.toString());
      if (isSuccess(result.statusCode)) {
        print("Cubit4");
        emit(AddAddressEditSuccess());
      } else {
        print("Cubit5");
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

  @override
  emit(AddAddressState state) {
    if (!isClosed) return super.emit(state);
  }
}
