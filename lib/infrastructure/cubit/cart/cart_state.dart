import '../../model/response/cart_items.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartInProgress extends CartState {}

class CartOperationError extends CartState {}

class CartError extends CartState {
  String? error;

  CartError({this.error});
}

class CartFetched extends CartState {
  CartFetched(this.cartInfo);

  final CartInfo? cartInfo;
}
