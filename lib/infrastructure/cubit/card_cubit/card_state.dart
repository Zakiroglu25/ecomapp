import '../../model/response/card_model.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardProgress extends CardState {}
class CardDelete extends CardState {}

class CardLoading extends CardState {}

class CardError extends CardState {
  String? error;

  CardError({this.error});
}

class CardNetworkError extends CardState {}

class CardSuccess extends CardState {
  CardSuccess(this.cardList);

  final CardModel cardList;
}
