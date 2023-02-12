import '../../model/response/orders_data.dart';

abstract class DeliveryOrdersState {}

class DeliveryOrdersInitial extends DeliveryOrdersState {}

class DeliveryOrdersInProgress extends DeliveryOrdersState {}

class DeliveryOrdersError extends DeliveryOrdersState {
  String? error;

  DeliveryOrdersError({this.error});
}

class DeliveryOrdersSuccess extends DeliveryOrdersState {
  DeliveryOrdersSuccess(this.orders);
  final List<CartOrder> orders;
}

class DeliveryOrdersSuccessTemp extends DeliveryOrdersSuccess {
  DeliveryOrdersSuccessTemp(this.orders) : super(orders);
  final List<CartOrder> orders;
}
