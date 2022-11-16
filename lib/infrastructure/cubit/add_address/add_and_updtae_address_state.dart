import '../../model/response/address_model.dart';

abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}

class AddAddressInProgress extends AddAddressState {}

class AddAddressError extends AddAddressState {
  String? error;

  AddAddressError({this.error});
}

class AddAddressNetworkError extends AddAddressState {}

class AddAddressSuccess extends AddAddressState {
}
