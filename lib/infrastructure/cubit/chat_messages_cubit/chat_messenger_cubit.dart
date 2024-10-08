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
  String? chatGuid;

  void fetch({bool? isLoading = false}) async {
    clearCache();
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }

    try {
      final result = await MessengerProvider.getChatMessage(chatGuid);
      iiii(result.data.toString());
      if (isSuccess(result.statusCode)) {
        final searchItems = result.data;
        // messages.addAll(searchItems!.data!);
        // totalPages = searchItems.totalPages!;
        updateHaveElse();
        emit(ChatMessengerSuccess(result.data!.list));
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

  void sendMessage({bool? isLoading = false, String? message}) async {
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }

    try {
      final result = await MessengerProvider.sendMessage(chatGuid, message);
      if (isSuccess(result.statusCode)) {
        emit(SendChatMessage());
        fetch();
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

  void configMessenger(
      {bool? isLoading = false,
      String? storeGuid,
      String? orderGuid,
      String? guid}) async {
    if (guid.isNotNull) {
      chatGuid = guid;
      fetch();
    } else {
      createMessenger(
          isLoading: true, storeGuid: storeGuid, orderGuid: orderGuid);
    }
  }

  void createMessenger(
      {bool? isLoading = false, String? storeGuid, String? orderGuid}) async {
    if (isLoading!) {
      emit(ChatMessengerInProgress());
    }
    try {
      final result = await MessengerProvider.createChat(orderGuid, storeGuid);
      if (result.isNotNull) {
        emit(ChatCreate());
        chatGuid = result!;
        fetch();
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

  void loadMore() async {
    eeee("current page:  $page");
    if (page >= totalPages) return;
    final result = await MessengerProvider.getChatMessage(chatGuid);
    if (result.statusCode.isSuccess) {
      messages.addAll(result.data!.list);
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
