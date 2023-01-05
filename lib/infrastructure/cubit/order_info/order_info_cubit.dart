import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/object.dart';

import '../../data/orders_provider.dart';
import 'order_info_state.dart';

class OrderInfoCubit extends Cubit<OrderInfoState> {
  OrderInfoCubit() : super(OrderInfoInitial());

  fetch({bool loading = true, required String guid}) async {
    if (loading) {
      emit(OrderInfoInProgress());
    }

    try {
      final result = await OrdersProvider.orderDetails(guid: guid);
      if (result.isNotNull) {
        emit(OrderInfoSuccess(result!));
      } else {
        emit(OrderInfoError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(OrderInfoError());
    }
  }

  @override
  emit(OrderInfoState state) {
    if (!isClosed) return super.emit(state);
  }
}
