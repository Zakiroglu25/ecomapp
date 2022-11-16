import 'dart:convert';

import 'package:uikit/infrastructure/cubit/map/map_store_cubit.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../infrastructure/config/dio_auth.dart';
import '../../../infrastructure/cubit/map/map_store_state.dart';
import '../../../infrastructure/model/response/map_medicine.dart';
import '../../../locator.dart';
import '../../../utils/constants/api_keys.dart';
import '../../../utils/delegate/my_printer.dart';
import '../map_details_page/map_details_page.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;

  LatLng? showLocation;
  Set<Marker> markers = Set();

  //
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapStoreCubit, MapStoreState>(
      builder: (context, state) {
        if (state is MapStoreSuccess) {
          List<MapMedicine> maps = state.addressModel;
          maps.forEach((element) {
            showLocation = LatLng(element.addressLat!, element.addressLong!);
            markers.add(
              Marker(
                markerId: MarkerId(maps.toString()),
                position: showLocation!, //position of marker
                infoWindow: InfoWindow(
                  onTap: () {
                    Go.to(context, MapDetailsPage(element));
                  },
                  title: "Aptekə keçid elə",
                ),
                icon: BitmapDescriptor.defaultMarker, //Icon for Marker
              ),
            );
          });

          return Scaffold(
            body: GoogleMap(
              zoomGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: showLocation!, //initial position
                zoom: 13.0, //initial zoom level
              ),
              markers: markers,
              //markers to show on map
              mapType: MapType.normal,
              //map type
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
            ),
          );
        } else {
          return Center(child: Text("Hec bir Aptek Movcud deyil")

          );
        }
      },
    );
  }
}
