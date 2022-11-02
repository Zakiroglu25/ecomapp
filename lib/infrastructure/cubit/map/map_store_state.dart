import '../../model/response/map_medicine.dart';

abstract class MapStoreState {}

class MapStoreInitial extends MapStoreState {}

class MapStoreInProgress extends MapStoreState {}

class MapStoreError extends MapStoreState {
  String? error;

  MapStoreError({this.error});
}

class MapStoreNetworkError extends MapStoreState {}

class MapStoreSuccess extends MapStoreState {
  MapStoreSuccess(this.addressModel);

  final List<MapMedicine> addressModel;
}
