import '../../model/response/product_option_model.dart';

abstract class BasketState {}

class BasketInitial extends BasketState {}

class BasketInProgress extends BasketState {}
class BasketAdding extends BasketState {}
class BasketNotAdding extends BasketState {}

class BasketError extends BasketState {
  String? error;

  BasketError({this.error});
}

class BasketNetworkError extends BasketState {}

class BasketSuccess extends BasketState {
  BasketSuccess(this.favResult);
  final FavResult favResult;
}
