import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/data/notification_provider.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../../utils/screen/snack.dart';
import '../../config/recorder.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  getNotification({bool loading = true, String? title}) async {
    if (loading) {
      emit(NotificationProgress());
    }
    try {
      final result = await NotificationProvider.getNotification();
      if (result.statusCode == 200) {
        // iiii("2"+result.statusCode.toString());
        emit(NotificationSuccess(result.data));
        // iiii("3"+result.data);

      } else {
        emit(NotificationError());
      }
    } on SocketException catch (_) {
      emit(NotificationError());
    } catch (e) {
      eeee("Notification Error" + e.toString());
      emit(NotificationError());
    }
  }

  Future<bool?> removeNotificion(
      {required String notificationId,
      bool? loading,
      required BuildContext context}) async {
    if (loading ?? true) {
      emit(NotificationProgress());
    }

    try {
      final result = await NotificationProvider.removeNotification(
          notificationId: notificationId);
      if (isSuccess(result!.statusCode)) {
        Snack.positive2(context, message: "Pozuldu");
        getNotification(loading: false);
      } else {
        emit(NotificationError());
      }
    } on SocketException catch (_) {
      emit(NotificationNetworkError());
      return false;
    } catch (e, s) {
      emit(NotificationError());
      Recorder.recordCatchError(e, s);
      return false;
    }
  }
}
