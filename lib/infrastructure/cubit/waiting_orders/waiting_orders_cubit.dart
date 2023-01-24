import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/extensions/object.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/enums/transaction_type.dart';
import '../../data/favorites_provider.dart';
import '../../data/orders_provider.dart';
import '../../model/response/orders_data.dart';
import '../../model/response/product_option_model.dart';
import '../../model/response/search_items.dart';
import 'waiting_orders_state.dart';

class WaitingOrdersCubit extends Cubit<WaitingOrdersState> {
  WaitingOrdersCubit() : super(WaitingOrdersInitial());

  int page = 1;
  int totalPages = 0;
  List<CartOrder> products = [];

  fetch({bool loading = true}) async {
    if (loading) {
      emit(WaitingOrdersInProgress());
    }
    clearCache();

    try {
      final result = await OrdersProvider.pendingOrders(page: page);
      if (result.isNotNull) {
        final searchItems = result?.data;
        products.addAll(searchItems!);
        totalPages = result!.totalPages!;
        updateHaveElse();
        emit(WaitingOrdersSuccess(products));
      } else {
        emit(WaitingOrdersError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(WaitingOrdersError());
    }
  }

  void clearCache() {
    products.clear();
    page = 1;
  }

  void loadMore() async {
    eeee("current page:  $page");
    if (page >= totalPages) return;
    final result = await OrdersProvider.pendingOrders(page: page + 1);
    if (result.isNotNull) {
      products.addAll(result!.data!);
      emit(WaitingOrdersSuccess(products));
      page++;
    }
    updateHaveElse();
  }

  //have else products checker
  final BehaviorSubject<bool> haveElse = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get haveElseStream => haveElse.stream;

  updateHaveElse() {
    if (page < totalPages) {
      haveElse.sink.add(true);
      return;
    }
    haveElse.sink.add(false);
  }

  @override
  emit(WaitingOrdersState state) {
    if (!isClosed) return super.emit(state);
  }
}
