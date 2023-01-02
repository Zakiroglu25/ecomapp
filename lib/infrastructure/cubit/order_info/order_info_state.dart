import 'package:uikit/infrastructure/model/response/search_items.dart';

import '../../model/response/order_details.dart';
import '../../model/response/orders_data.dart';
import '../../model/response/product_option_model.dart';

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
