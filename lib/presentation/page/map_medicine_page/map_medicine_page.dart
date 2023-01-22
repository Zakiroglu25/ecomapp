import 'dart:typed_data';

import 'package:flutter/material.dart';
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
import '../../../widgets/custom/info_window.dart';
import '../../../widgets/general/app_loading.dart';
import '../map_details_page/map_details_page.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  GoogleMapController? mapController;

  Set<Marker> markers = Set();
   BitmapDescriptor? icon;

  @override
  void initState() {
    getIcons();
    super.initState();
  }

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 3.3), Assets.marker);
    setState(() {
      if(icon == null){
        BitmapDescriptor.defaultMarker;
      }else{
      this.icon = icon;

      }
    });
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
          LatLng? showLocation;
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
                            onTap: () {
                              Go.to(context, MapDetailsPage(element));
                            },
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
                icon: BitmapDescriptor.defaultMarker, //Icon for Marker
              ),
            );
          });

          return Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(40.39427, 49.880143), //initial positi, //initial position
                    zoom: 13.0, //initial zoom level
                  ),
                  onTap: (position) {
                    _customInfoWindowController.hideInfoWindow!();
                  },
                  onCameraMove: (position) {
                    _customInfoWindowController.onCameraMove!();
                  },
                  markers: markers,
                  //markers to show on map
                  mapType: MapType.normal,
                  //map type
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
                // CustomInfoWindow(
                //   controller: ,
                //   height: MediaQuery.of(context).size.width * 0.12,
                //   width: MediaQuery.of(context).size.width * 0.4,
                //   offset: 50,
                // ),
              ],
            ),
          );
        } else if (state is MapStoreInProgress) {
          return AppLoading.main();
        } else if (state is MapStoreError) {
          return AppLoading.main();
        }
        return Center(child: Text("Hec bir Aptek Movcud deyil"));
      },
    );
  }
}
