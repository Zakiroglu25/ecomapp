import 'package:uikit/infrastructure/model/response/search_items.dart';

import '../../model/response/product_option_model.dart';

abstract class WaitingOrdersState {}

class WaitingOrdersInitial extends WaitingOrdersState {}

class WaitingOrdersInProgress extends WaitingOrdersState {}

class WaitingOrdersError extends WaitingOrdersState {
  String? error;

  WaitingOrdersError({this.error});
}

class WaitingOrdersSuccess extends WaitingOrdersState {
  WaitingOrdersSuccess(this.searchItems);
  final SearchItems searchItems;
}
