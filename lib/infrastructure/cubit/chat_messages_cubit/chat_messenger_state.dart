import '../../model/response/messenger_chats.dart';

abstract class ChatMessengerState {}

class ChatMessengerInitial extends ChatMessengerState {}

class ChatMessengerInProgress extends ChatMessengerState {}

class ChatMessengerInAdding extends ChatMessengerState {}

class ChatMessengerError extends ChatMessengerState {
  String? error;

  ChatMessengerError({this.error});
}

class SendChatMessage extends ChatMessengerState {}

class SendChatMessageError extends ChatMessengerState {
  String? error;

  SendChatMessageError({this.error});
}

class ChatMessengerNetworkError extends ChatMessengerState {}

class ChatMessengerSuccess extends ChatMessengerState {
  ChatMessengerSuccess(this.contactList);

  final List<Data> contactList;
}
