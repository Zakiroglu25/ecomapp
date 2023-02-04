import '../../model/response/orders_data.dart';

abstract class WaitingOrdersState {}

class WaitingOrdersInitial extends WaitingOrdersState {}

class WaitingOrdersInProgress extends WaitingOrdersState {}

class WaitingOrdersError extends WaitingOrdersState {
  String? error;

  WaitingOrdersError({this.error});
}

class WaitingOrdersSuccess extends WaitingOrdersState {
  WaitingOrdersSuccess(this.orders);
  final List<CartOrder> orders;
}

class WaitingOrdersSuccessTemp extends WaitingOrdersSuccess {
  WaitingOrdersSuccessTemp(this.orders) : super(orders);
  final List<CartOrder> orders;
}
