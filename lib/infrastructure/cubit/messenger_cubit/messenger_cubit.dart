import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/messenger_provider.dart';
import 'messenger_state.dart';

class MessengerCubit extends Cubit<MessengerState> {
  MessengerCubit() : super(MessengerInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(MessengerInProgress());
    }

    try {
      final result = await MessengerProvider.getMessage();
      if (isSuccess(result.statusCode)) {
        emit(MessengerSuccess(result.data));
      } else {
        emit(MessengerError());
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(MessengerNetworkError());
    } catch (e, s) {
      eeee("MessengerCubit fetch catch: $e");
      emit(MessengerError(error: e.toString()));
    }
  }
}
