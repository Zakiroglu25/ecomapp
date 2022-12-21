import '../../model/response/cart_items.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartInProgress extends CartState {}

class CartAdding extends CartState {}

class CartDeleted extends CartState {}

class CartNotAdding extends CartState {}

class CartError extends CartState {
  String? error;

  CartError({this.error});
}

class CartNetworkError extends CartState {}

class CartFetched extends CartState {
  CartFetched(this.items);
  final List<CartItem> items;
}

class CartSuccess extends CartState {
  CartSuccess(this.items);
  final List<CartItem> items;
}
