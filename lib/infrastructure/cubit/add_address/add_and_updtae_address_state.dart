abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}

class AddAddressInProgress extends AddAddressState {}

class AddAddressError extends AddAddressState {
  String? error;

  AddAddressError({this.error});
}

class UserButtonActive extends AddAddressState {}
class AddAddressNetworkError extends AddAddressState {}

class AddAddressSuccess extends AddAddressState {}

class AddAddressEditSuccess extends AddAddressState {}
