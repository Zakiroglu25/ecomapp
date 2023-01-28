import 'package:uikit/infrastructure/model/response/search_items.dart';

import '../../model/response/orders_data.dart';
import '../../model/response/product_option_model.dart';

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
