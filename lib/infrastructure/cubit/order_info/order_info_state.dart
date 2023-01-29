import '../../model/response/order_details.dart';

abstract class OrderInfoState {}

class OrderInfoInitial extends OrderInfoState {}

class OrderInfoInProgress extends OrderInfoState {}

class OrderInfoError extends OrderInfoState {
  String? error;

  OrderInfoError({this.error});
}

class OrderInfoSuccess extends OrderInfoState {
  OrderInfoSuccess(this.orderDetails);
  final OrderDetails orderDetails;
}
