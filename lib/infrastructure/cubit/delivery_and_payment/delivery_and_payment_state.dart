import 'package:uikit/infrastructure/model/response/order_details.dart';

abstract class DeliveryAndPaymentState {}

class DeliveryAndPaymentInitial extends DeliveryAndPaymentState {}

class DeliveryAndPaymentInProgress extends DeliveryAndPaymentState {}

class DeliveryAndPaymentError extends DeliveryAndPaymentState {
  String? error;

  DeliveryAndPaymentError({this.error});
}

class DeliveryAndPaymentSuccess extends DeliveryAndPaymentState {
  final OrderDetails orderDetails;

  DeliveryAndPaymentSuccess({required this.orderDetails});
}
