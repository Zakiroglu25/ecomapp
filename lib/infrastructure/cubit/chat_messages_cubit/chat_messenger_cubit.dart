import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/messenger_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_messenger_state.dart';

class ChatMessengerCubit extends Cubit<ChatMessengerState> {
  ChatMessengerCubit() : super(ChatMessengerInitial());

  void fetch(
      {required BuildContext context,
      bool? isLoading = false,
      required String guid}) async {
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }

    try {
      final result = await MessengerProvider.getChatMessage(guid);
      if (isSuccess(result.statusCode)) {
        emit(ChatMessengerSuccess(result.data));
      } else {
        emit(ChatMessengerError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ChatMessengerNetworkError());
    } catch (e, s) {
      eeee("ChatMessengerCubit fetch catch: $e");
      emit(ChatMessengerError(error: e.toString()));
    }
  }

  void sendMessage(
      {required BuildContext context,
      bool? isLoading = false,
      String? message,
      String? guid}) async {
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }

    try {
      final result = await MessengerProvider.sendMessage(guid, message);
      if (isSuccess(result.statusCode)) {
        emit(SendChatMessage());
        fetch(context: context, guid: guid!);
      } else {
        emit(SendChatMessageError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(SendChatMessageError());
    } catch (e, s) {
      eeee("ChatMessengerCubit fetch catch: $e");
      emit(SendChatMessageError(error: e.toString()));
    }
  }
}
