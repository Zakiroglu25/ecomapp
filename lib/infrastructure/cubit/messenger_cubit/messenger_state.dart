
import '../../model/response/messenger_users.dart';

abstract class MessengerState {}

class MessengerInitial extends MessengerState {}

class MessengerInProgress extends MessengerState {}

class MessengerInAdding extends MessengerState {}

class MessengerError extends MessengerState {
  String? error;

  MessengerError({this.error});
}

class MessengerNetworkError extends MessengerState {}

class MessengerSuccess extends MessengerState {
  MessengerSuccess(this.contactList);

  final List<Data> contactList;
}
