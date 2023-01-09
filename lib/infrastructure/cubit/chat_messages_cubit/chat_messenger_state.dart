

import '../../model/response/messenger_chats.dart';

abstract class ChatMessengerState {}

class MessengerInitial extends ChatMessengerState {}

class MessengerInProgress extends ChatMessengerState {}

class MessengerInAdding extends ChatMessengerState {}

class MessengerError extends ChatMessengerState {
  String? error;

  MessengerError({this.error});
}

class MessengerNetworkError extends ChatMessengerState {}

class MessengerSuccess extends ChatMessengerState {
  MessengerSuccess(this.contactList);

  final List<Data> contactList;
}
