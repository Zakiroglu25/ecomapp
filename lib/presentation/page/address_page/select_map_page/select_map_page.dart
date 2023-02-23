import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../infrastructure/model/response/address_model.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../widgets/custom/app_button.dart';
import '../../add_address_page/add_address_page.dart';

class SelectMapPage extends StatefulWidget {
  const SelectMapPage({Key? key, this.addressModel}) : super(key: key);
  final Address? addressModel;

  @override
  _SelectMapPageState createState() => _SelectMapPageState();
}

class _SelectMapPageState extends State<SelectMapPage> {
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(40.409264, 49.867092),
    zoom: 14.4746,
  );

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            // pass icon widget
            iconWidget: Icon(
              Icons.location_on_sharp,
              size: 30,
            ),
            //add map picker controller
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMoveStarted: () {
                mapPickerController.mapMoving!();
                textController.text = "Axtarilir....";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                mapPickerController.mapFinishedMoving!();
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );
                // update the ui with the address
                textController.text =
                    '${placemarks.first.name?.replaceAll('\n', '').trim()}, ${placemarks.first.locality?.replaceAll('\n', '')}, ${placemarks.first.country?.replaceAll('\n', '').trim()}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: AppButton(
              text: "Addresi tesdiq et",
              onTap: () {
                // Navigator.of(context).pop(textController.text);
                // context
                //     .read<AddAddressCubit>()
                //     .updateStreet(textController.text);
                BlocProvider.of<AddAddressCubit>(context)
                    .updateStreet(textController.text);
                bbbb("textController.text: ${textController.text.trim()}");
                BlocProvider.of<AddAddressCubit>(context).updateLatLong(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );
                Go.pop(context);

                // Go.replace(
                //     context,
                //     BlocProvider(
                //       create: (context) => AddAddressCubit(),
                //       child: AddAddressPage(
                //         textController: textController,
                //         lat: cameraPosition.target.latitude,
                //         lng: cameraPosition.target.longitude,
                //         addressModel: widget.addressModel,
                //       ),
                //     ));
              },
            ),
          )
        ],
      ),
    );
  }
}
