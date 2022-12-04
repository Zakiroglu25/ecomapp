import '../../model/response/product_option_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartInProgress extends CartState {}

class CartAdding extends CartState {}

class CartNotAdding extends CartState {}

class CartError extends CartState {
  String? error;

  CartError({this.error});
}

class CartNetworkError extends CartState {}

class CartSuccess extends CartState {
  CartSuccess(this.favResult);
  final FavResult favResult;
}
