import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/messenger_provider.dart';
import '../../model/response/messenger_chats.dart';
import 'chat_messenger_state.dart';

class ChatMessengerCubit extends Cubit<ChatMessengerState> {
  ChatMessengerCubit() : super(ChatMessengerInitial());

  int page = 1;
  int totalPages = 0;
  List<Data> messages = [];
  late final FocusNode searchFocus = FocusNode();

  void fetch(
      {required BuildContext context,
      bool? isLoading = false,
      required String guid}) async {
    clearCache();
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }

    try {
      final result = await MessengerProvider.getChatMessage(guid, page);
      if (isSuccess(result.statusCode)) {
        final searchItems = result.data;
        messages.addAll(searchItems!.data!);
        totalPages = searchItems.totalPages!;
        updateHaveElse();
        emit(ChatMessengerSuccess(result.data!.data!));
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

  void createMessenger(
      {required BuildContext context,
      bool? isLoading = false,
      String? storeGuid,
      String? orderGuid}) async {
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }
    try {
      final result = await MessengerProvider.createChat(storeGuid, orderGuid);
      if (isSuccess(result.statusCode)) {
        emit(ChatCreate());
        // fetch(context: context, guid: guid!);
      } else {
        emit(ChatCreateError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(ChatCreateError());
    } catch (e, s) {
      eeee("ChatMessengerCubit fetch catch: $e");
      emit(ChatCreateError(error: e.toString()));
    }
  }

  void clearCache() {
    messages.clear();
    page = 1;
  }

  void loadMore(String guid) async {
    eeee("current page:  $page");
    if (page >= totalPages) return;
    final result = await MessengerProvider.getChatMessage(guid, page + 1);
    if (result.statusCode.isSuccess) {
      messages.addAll(result.data!.data!);
      emit(ChatMessengerSuccess(messages));
      page++;
    }
    updateHaveElse();
  }

//have else products checker
  final BehaviorSubject<bool> haveElse = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get haveElseStream => haveElse.stream;

  updateHaveElse() {
    if (page < totalPages) {
      haveElse.sink.add(true);
      return;
    }
    haveElse.sink.add(false);
  }
}

