
import '../../model/response/contact_model.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactInProgress extends ContactState {}

class ContactError extends ContactState {
  String? error;

  ContactError({this.error});
}

class ContactNetworkError extends ContactState {}

class ContactSuccess extends ContactState {
  ContactSuccess(this.contact);

  final List<Contacts> contact;
}
