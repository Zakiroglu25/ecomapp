abstract class DeliveryAndPaymentState {}

class DeliveryAndPaymentInitial extends DeliveryAndPaymentState {}

class DeliveryAndPaymentInProgress extends DeliveryAndPaymentState {}

class DeliveryAndPaymentError extends DeliveryAndPaymentState {
  String? error;
  DeliveryAndPaymentError({this.error});
}

class DeliveryAndPaymentSuccess extends DeliveryAndPaymentState {}
