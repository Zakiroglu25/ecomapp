import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../infrastructure/model/response/address_model.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../widgets/general/app_field.dart';
import 'fields/region_field.dart';
import 'fields/title_fields.dart';

class AddAddressPage extends StatefulWidget {
  final AddressModel? addressModel;

  AddAddressPage({Key? key, this.addressModel}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  Position? _currentPosition;
  String? _currentAddress;

  // LocationData? currentLocation;
  // String address = "";

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy:LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;
    print("Latitude: $lat and Longitude: $long");
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

print(";alf;ajf;klqjkfj");
      Placemark place = placemarks[0];
        print("${place.locality}, ${place.postalCode}, ${place.country}");

      setState(() {

        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        user: false,
        notification: false,
        addressDropdown: false,
        contextA: context,
        title: "Yeni ünvan yarat",
      ),
      body: ListView(
        children: [
          TitleField(
            controller: TextEditingController(text: widget.addressModel!.title),
          ),
          RegionField(
            controller:
                TextEditingController(text: widget.addressModel!.region),
          ),
          // AddressField()
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_currentAddress != null)
                  Text(_currentAddress!),
                ElevatedButton(
                    onPressed: () {
                      print("s;kalkanlkf");
                      getCurrentLocation();
                    },
                    child: Text(
                      "Salam",
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
