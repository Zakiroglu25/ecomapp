import '../../model/response/card_model.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardInProgress extends CardState {}

class CardDeleted extends CardState {}

class CardError extends CardState {
  String? error;

  CardError({this.error});
}

class CardSuccess extends CardState {
  CardSuccess(this.cardData);

  final CardListModel cardData;
}
