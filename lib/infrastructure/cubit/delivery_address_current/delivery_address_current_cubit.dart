import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/data/public_provider.dart';
import 'package:uikit/infrastructure/model/response/big_data_info.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../locator.dart';
import '../../../utils/constants/durations.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/screen/alert.dart';
import '../../config/recorder.dart';
import '../../data/address_provider.dart';
import '../../services/hive_service.dart';
import '../../services/navigation_service.dart';
import 'delivery_address_current_state.dart';

class DeliveryAddressCurrentCubit extends Cubit<DeliveryAddressCurrentState> {
  DeliveryAddressCurrentCubit() : super(DeliveryAdressCurrentInitial());

// HiveService get _prefs => locator<HiveService>();
  final context = NavigationService.instance.navigationKey?.currentContext;

  HiveService get _prefs => locator<HiveService>();

  String? coordinates;
  String? address;
  String? regionTitle;
  late Position position;
  Administrative? administrative;
  Placemark placemark = Placemark();

  void get([bool loading = true]) async {
    emit(DeliveryAdressCurrentInProgress());
    try {
      if (loading) {
        emit(DeliveryAdressCurrentInProgress());
      }
      position = await _determinePosition();

      final lat = position.latitude;
      final long = position.longitude;
      final _location = "$lat , $long";

      List<Placemark> addresses = await placemarkFromCoordinates(lat, long);
      final locData =
          await PublicProvider.getLocDataFromBigData(lat: lat, long: long);
      placemark = addresses.first;
      if (locData.statusCode.isSuccess) {
        administrative = (locData.data as LocalityInfo).administrative?.last;
        regionTitle = administrative?.name;
      }
      bbbb("region: $regionTitle");

      if (placemark != null) {
        final _address =
            (placemark.thoroughfare == null || placemark.thoroughfare == '')
                ? '${placemark.subAdministrativeArea}'
                : '${placemark.subAdministrativeArea}, '.notEmpty +
                    '${placemark.subLocality}, '.notEmpty +
                    '${placemark.thoroughfare} '.notEmpty +
                    '${placemark.subThoroughfare}'.notEmpty;

        address = _address;
        coordinates = _location;
        await Future<void>.delayed(Durations.ms100);
        emit(DeliveryAdressCurrentSuccess(
            location: _location, address: _address));
      } else {
        emit(DeliveryAdressCurrentError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(DeliveryAdressCurrentError(error: MyText.networkError));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      // emit(DeliveryAdressCurrentError());
    }
    // emit(DeliveryAdressSuccess());
  }

  // Future<int?> getLocationFromGoogle({required List<Region> regionList}) async {
  //   final lat = position.latitude;
  //   final long = position.longitude;
  //   final _location = "$lat , $long";
  //
  //   final locData =
  //       await PublicProvider.getLocDataFromGoogleMap(lat: lat, long: long);
  //   //print("nname: ${first.name} :administrativeArea:  ${first}");
  //
  //   if (locData.statusCode.isSuccess) {
  //     final mapResult = (locData.data as List<GoogleMapResults>);
  //
  //     if (mapResult.isEmpty) return null;
  //
  //     for (GoogleMapResults res in mapResult) {
  //       if (res.addressComponents == null) return null;
  //       for (AddressComponents comp in res.addressComponents!) {
  //         final regionFirstPart = comp.longName?.first;
  //
  //         final declaredRegions = regionList.where((element) =>
  //             element.eng == regionFirstPart ||
  //             element.name?.first == regionFirstPart);
  //         if (declaredRegions.isNotEmpty) {
  //           final int id = declaredRegions.first.id!;
  //           eeee("mappo: $id");
  //           return id;
  //         }
  //       }
  //     }
  //   }
  //
  //   // emit(DeliveryAdressSuccess());
  // }

  void add(BuildContext context, {bool loading = true}) async {
    bbbb("jhhkjjk");
    try {
      if (loading) {
        emit(DeliveryAdressCurrentInProgress());
      }

      if (regionTitle == null || coordinates == null) {
        return;
      }
      final result = await AddressProvider.addAddress(
          city: regionTitle,
          country: placemark.country,
          title: "$address $coordinates",
          houseNumber: null,
          streetName: placemark.street,
          phone: _prefs.user.phone,
          latitude: "${position.latitude}",
          longitude: "${position.longitude}",
          description: "$placemark".trim(),
          isMain: true);
      //
      if (result.statusCode.isSuccess) {
        emit(DeliveryAdressCurrentAdded());
      }
      emit(DeliveryAdressCurrentSuccess(
          location: coordinates!, address: address!));
      //emit(DeliveryAdressOperationsInProgress());
    } on SocketException catch (_) {
      emit(DeliveryAdressCurrentError(error: MyText.networkError));
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAdressCurrentError());
    }
  }

  // Future<int?> declareRegionId({
  //   required String region,
  //   required List<Region> regionList,
  // }) async {
  //   try {
  //     final regionFirstPart = region.first;
  //     int? id;
  //     final declaredRegions = regionList.where((element) =>
  //         element.eng == regionFirstPart ||
  //         element.name?.first == regionFirstPart);
  //     //burada evvelce bigDataCloud apisinden region axtarrir
  //     //tapmayanda ise elsenin icinde
  //     //googlemap apisinde region axtarir
  //     //oradad da tapmasa id 14 - Diger qaytarir
  //     if (declaredRegions.isNotEmpty) {
  //       //bigDataCloud
  //       id = declaredRegions.first.id!;
  //     } else {
  //       //googleMap
  //       id = await getLocationFromGoogle(regionList: regionList);
  //     }
  //     return id;
  //   } on SocketException catch (_) {
  //     emit(DeliveryAdressCurrentError(error: MyText.network_error));
  //   } catch (e) {
  //     emit(DeliveryAdressCurrentError());
  //   }
  // }

  // void goToAddPage(
  //     {required BuildContext context,
  //     required List<Region> regions,
  //     DeliveryAddress? deliveryAddress}) async {
  //   try {
  //     showCupertinoModalBottomSheet(
  //       expand: true,
  //       context: context,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) => Pager.deliveryAddressOperations(
  //           context: context,
  //           regions: regions,
  //           deliveryAddress: deliveryAddress),
  //     );
  //   } on SocketException catch (_) {
  //     emit(DeliveryAdressCurrentError(error: MyText.network_error));
  //   } catch (e, s) {
  //     Recorder.recordCatchError(e, s);
  //   }
  // }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    loc.Location location = loc.Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    loc.LocationData _locationData;

    // await location.requestService();
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {}
    // }
    //
    // _permissionGranted = (await location.hasPermission()) as PermissionStatus;
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted =
    //       (await location.requestPermission()) as PermissionStatus;
    //   if (_permissionGranted != PermissionStatus.granted) {}
    // }

    // Test if location services are enabled.
    serviceEnabled = await location.requestService();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      emit(DeliveryAdressCurrentDenied());
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        emit(DeliveryAdressCurrentDenied());
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      emit(DeliveryAdressCurrentDisabled());
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> showAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_locatoin,
        content: MyText.we_will_redirect_to_settings_locatoin,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

  //--------------------values:-----------------

  //selected  adress id
  final BehaviorSubject<int?> selectedAdressId = BehaviorSubject<int>();

  Stream<int?> get selectedAdressIdStream => selectedAdressId.stream;

  updateSelectedAdressId(int? value) {
    if (value == null) {
      selectedAdressId.value = null;
      //taxNumber.sink.addError(MyText.field_is_not_correct);
    } else {
      selectedAdressId.sink.add(value);
    }
  }

  bool get isSelectedAdressIdIncorrect =>
      (!selectedAdressId.hasValue || selectedAdressId.value == null);

//note
  final BehaviorSubject<String> note = BehaviorSubject<String>();

  Stream<String> get noteStream => note.stream;

  updateNote(String value) {
    if (value.isEmpty) {
      note.value = '';
      note.sink.addError(MyText.field_is_not_correct);
    } else {
      note.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isNoteIncorrect => (!note.hasValue || note.value.isEmpty);

  //details
  final BehaviorSubject<String> details = BehaviorSubject<String>();

  Stream<String> get detailsStream => note.stream;

  updateDetails(String value) {
    if (value.isEmpty) {
      details.value = '';
      details.sink.addError(MyText.field_is_not_correct);
    } else {
      details.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isDetailsIncorrect => (!details.hasValue || details.value.isEmpty);

  //is user data valid
  bool isUserDataValid() {
    if (!isDetailsIncorrect && !isNoteIncorrect) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> close() {
    note.close();
    details.close();
    return super.close();
  }
}
