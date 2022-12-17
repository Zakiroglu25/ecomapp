import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:uikit/infrastructure/data/public_provider.dart';

import '../../../utils/constants/text.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  getCard({bool loading = true, String? title}) async {
    if (loading) {
      emit(CardProgress());
    }
    try {
      final result = await PublicProvider.getCard();

      if (isSuccess(result.statusCode)) {
        emit(CardSuccess(result.data));
      } else {
        emit(CardError());
      }
    } on SocketException catch (_) {
      emit(CardError());
    } catch (e) {
      eeee("Product Option Error" + e.toString());
      emit(CardError());
    }
  }

  void deleteCard(String? id, {bool loading = true}) async {
    if (loading) {
      emit(CardProgress());
    }
    try {
      final result = await PublicProvider.deleteCArd(guid: "$id");
      if (isSuccess(result!.statusCode)) {
        emit(CardDelete());
        // getCard(false);
      } else {
        emit(CardError(error: MyText.error));
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(CardNetworkError());
    } catch (e) {
      emit(CardError(error: MyText.error + " " + e.toString()));
    }

    //user/attorneys/delete
  }
}
