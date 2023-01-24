import 'package:bloc/bloc.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/infrastructure/data/public_provider.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/constants/text.dart';
import 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  getCard({bool loading = true, String? title}) async {
    if (loading) emit(CardInProgress());
    try {
      CardListModel? result = await PublicProvider.getCard();
      // result?.list.add(CardData(
      //     guid: "dfsf", brand: "sdads", pan: "dsd", cardHolderName: "sdffd"));
      if (result.isNotNull) {
        emit(CardSuccess(result!));
      } else {
        emit(CardError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CardError());
    }
  }

  void deleteCard(String? id, {bool loading = true}) async {
    if (loading) {
      emit(CardInProgress());
    }
    try {
      final result = await PublicProvider.deleteCArd(guid: "$id");
      if (result!.statusCode.isSuccess) {
        emit(CardDeleted());
        getCard(loading: false);
      } else {
        emit(CardError(error: MyText.error));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CardError());
    }

    //user/attorneys/delete
  }
}
