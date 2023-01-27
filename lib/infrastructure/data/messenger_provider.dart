import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/response/messenger_users.dart';
import 'package:uikit/infrastructure/model/response/status_dynamic.dart';
import 'package:uikit/utils/constants/result_keys.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../locator.dart';
import '../../utils/constants/api_keys.dart';
import '../config/dio_auth.dart';
import '../model/response/messenger_chats.dart';

class MessengerProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getMessage() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.getMessenger;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    wtf(response.toString());
    if (response.statusCode == ResultKey.successCode) {
      final comeJson = response.data;

      statusDynamic.data = MessengerUser.fromJson(comeJson).data;
    } else {
      eeee(
          "GetMessages error :${response.requestOptions.path},response: $response");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic<ChatMessagesModel>> getChatMessage(String? guid,int page) async {
    StatusDynamic<ChatMessagesModel> statusDynamic = StatusDynamic();
    final api = ApiKeys.getMessenger + "/$guid";
    final response = await dioAuth.dio.get(api,queryParameters: {"page": page});
    wtf(page.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      ChatMessagesModel model = ChatMessagesModel.fromJson(response.data);
      statusDynamic.data = model;
    } else {
      eeee(
          "GetMessages error :${response.requestOptions.path},response: $response");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> sendMessage(
      String? guid, String? message) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.getMessenger + "/$guid";
    final body = {"message": message};
    final response = await dioAuth.dio.post(api, data: jsonEncode(body));
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      iiii("Mesaj Gonderildi");
    } else {
      eeee(
          "sendMessage Messages error :${response.requestOptions.path},response: $response");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic> createChat(
      String? orderGuid, String? storeGuid) async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.getMessenger;
    final body = {
      "storeGuid": storeGuid,
      "orderGuid": orderGuid,
    };
    final response = await dioAuth.dio.post(api, data: jsonEncode(body));
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      iiii("Chat Otagi yaradildi");
    } else {
      eeee(
          "sendMessage Messages error :${response.requestOptions.path},response: $response");
    }

    return statusDynamic;
  }
}
