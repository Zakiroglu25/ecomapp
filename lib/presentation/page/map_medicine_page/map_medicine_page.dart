import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uikit/infrastructure/cubit/map/map_store_cubit.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';

import '../../../infrastructure/cubit/map/map_store_state.dart';
import '../../../infrastructure/model/response/map_medicine.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/index.dart';
import '../../../widgets/custom/info_window.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../widgets/general/app_loading.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  Set<Marker> markers = Set();
  BitmapDescriptor? icon;

  @override
  void initState() {
    getIcons();
    super.initState();
  }

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          devicePixelRatio: 3.0,
        ),
        Assets.pngNewMarker);

    // Set the custom size for the marker icon
    final Uint8List markerIcon =
    await getBytesFromAsset(Assets.pngNewMarker, 65); // 60 is the custom size

    setState(() {
      if (icon == null) {
        BitmapDescriptor.defaultMarker;
      } else {
        this.icon = BitmapDescriptor.fromBytes(markerIcon);
      }
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void dispose() {
    //  mapController?.dispose();
    _customInfoWindowController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapStoreCubit, MapStoreState>(
      builder: (context, state) {
        if (state is MapStoreSuccess) {
          List<MapMedicine> maps = state.addressModel;
          maps.forEach((element) {
            LatLng? showLocation =
            LatLng(element.addressLat!, element.addressLong!);
            markers.add(
              Marker(
                markerId: MarkerId(element.guid.toString()),
                position: showLocation, //position of marker
                onTap: () {
                  _customInfoWindowController.addInfoWindow!(
                    Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () =>
                                Go.to(context, Pager.pharmacy(element)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(36),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Aptekə keçid elə",
                                    style: AppTextStyles.sfPro400s14
                                        .copyWith(color: MyColors.white),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ],
                    ),
                    showLocation,
                  );
                },
                // infoWindow: InfoWindow(
                //   onTap: () {
                //     Go.to(context, MapDetailsPage(element));
                //   },
                //   title: "Aptekə keçid elə",
                // ),
                icon: icon == null
                    ? BitmapDescriptor.defaultMarker
                    : icon!, //Icon for Marker
              ),
            );
          });

          return Scaffold(
            appBar: DoctorAppbar(
              user: true,
              notification: true,
              title: MyText.pharmacies,
              filter: false,
            ),
            body: Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: true,
                  padding: EdgeInsets.only(top: 20.0,),
                  zoomGesturesEnabled: true,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(40.39427, 49.880143),
                    zoom: 12.0, //initial zoom level
                  ),

                  onTap: (position) {
                    _customInfoWindowController.hideInfoWindow!();
                  },
                  onCameraMove: (position) {
                    _customInfoWindowController.onCameraMove!();
                  },

                  markers: markers,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) async {
                    _customInfoWindowController.googleMapController =
                        controller;
                  },

                ),
                CustomInfoWindow(
                  controller: _customInfoWindowController,
                  height: 48,
                  width: 133,
                ),
              ],
            ),
          );
        } else if (state is MapStoreInProgress) {
          return const AppLoading();
        } else if (state is MapStoreError) {
          return const AppLoading();
        }
        return const Center(child: Text("Hec bir Aptek Movcud deyil"));
      },
    );
  }
}