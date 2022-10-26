import 'package:doctoro/infrastructure/model/response/address_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressInProgress extends AddressState {}

class AddressError extends AddressState {
  String? error;

  AddressError({this.error});
}

class AddressNetworkError extends AddressState {}

class AddressSuccess extends AddressState {
  AddressSuccess(this.addressModel);

  final List<AddressModel> addressModel;
}
