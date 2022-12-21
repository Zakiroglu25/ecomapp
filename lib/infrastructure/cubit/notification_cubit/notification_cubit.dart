import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:uikit/infrastructure/data/notification_provider.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  getNotification({bool loading = true, String? title}) async {
    if (loading) {
      emit(NotificationProgress());
    }
    try {
      final result = await NotificationProvider.getNotification();

      if (isSuccess(result.statusCode)) {
        emit(NotificationSuccess(result.data));
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

// void deleteNotification(String? id, {bool loading = true}) async {
//   if (loading) {
//     emit(NotificationProgress());
//   }
//   try {
//     final result = await PublicProvider.deleteNotification(guid: "$id");
//     if (isSuccess(result!.statusCode)) {
//       emit(NotificationDelete());
//       // getNotification(false);
//     } else {
//       emit(NotificationError(error: MyText.error));
//     }
//   } on SocketException catch (_) {
//     //network olacaq
//     emit(NotificationNetworkError());
//   } catch (e) {
//     emit(NotificationError(error: MyText.error + " " + e.toString()));
//   }
//
//   //user/attorneys/delete
// }
}
