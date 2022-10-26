import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../data/address_provider.dart';
import '../../data/map_store_provider.dart';
import '../../model/remote/general/MyMessage.dart';
import '../../services/hive_service.dart';
import 'map_store_state.dart';

class MapStoreCubit extends Cubit<MapStoreState> {
  MapStoreCubit() : super(MapStoreInitial());


  void fetch([bool loading = true]) async {
    if (loading) {
      emit(MapStoreInProgress());
    }
    try {
      final result = await MapStoreProvider.getMarkers();
      iiii("map cubit result "+result.toString());
      if (result.isNotEmpty) {
        emit(MapStoreSuccess(result));
      }else{
        emit(MapStoreError(error: "Xeta"));
      }
    } on SocketException catch (_) {
      emit(MapStoreNetworkError());
    } catch (e) {
      eeee("address catch: $e");
      emit(MapStoreError(error: e.toString()));
    }
  }
}
