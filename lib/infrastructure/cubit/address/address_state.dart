import '../../model/response/address_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressInProgress extends AddressState {}

class AddressError extends AddressState {
  String? error;

  AddressError({this.error});
}

class AddressNetworkError extends AddressState {}

class AddressDelete extends AddressState {}

class AddressSuccess extends AddressState {
  AddressSuccess(this.addressList);

  final List<AddressModel> addressList;
}
