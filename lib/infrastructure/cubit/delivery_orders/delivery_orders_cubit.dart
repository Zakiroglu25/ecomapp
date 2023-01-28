import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/extensions/object.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../data/orders_provider.dart';
import '../../model/response/orders_data.dart';
import 'index.dart';

class DeliveryOrdersCubit extends Cubit<DeliveryOrdersState> {
  DeliveryOrdersCubit() : super(DeliveryOrdersInitial());

  int page = 1;
  int totalPages = 0;
  List<CartOrder> products = [];

  fetch({bool loading = true}) async {
    if (loading) {
      emit(DeliveryOrdersInProgress());
    }
    clearCache();

    try {
      final result = await OrdersProvider.deliveryOrders(page: page);
      if (result.isNotNull && result!.data.isNotEmptyOrNull) {
        final searchItems = result.data;
        products.addAll(searchItems!);
        totalPages = result.totalPages!;
        updateHaveElse();
        emit(DeliveryOrdersSuccess(products));
      } else {
        emit(DeliveryOrdersError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryOrdersError());
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
      emit(DeliveryOrdersSuccess(products));
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
  emit(DeliveryOrdersState state) {
    if (!isClosed) return super.emit(state);
  }
}
