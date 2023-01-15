import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/my_printer.dart';
import 'package:uikit/utils/enums/payment_type.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/screen/snack.dart';

import '../../../utils/delegate/file_operations.dart';
import '../../../utils/enums/operation_type.dart';
import '../../../utils/screen/alert.dart';
import '../../../utils/screen/overlay_loader.dart';
import '../../data/cart_provider.dart';
import '../../data/images_provider.dart';
import '../../data/orders_provider.dart';
import '../../model/response/cart_items.dart';
import '../tab_counts/tab_counts_cubit.dart';
import 'delivery_and_payment_state.dart';

class DeliveryAndPaymentCubit extends Cubit<DeliveryAndPaymentState> {
  DeliveryAndPaymentCubit() : super(DeliveryAndPaymentInitial());

  fetch({bool loading = true, required String guid}) async {
    // updateProducts([]);
    if (loading) {
      emit(DeliveryAndPaymentInProgress());
    }
    try {
      final result = await OrdersProvider.orderDetails(guid: guid);
      if (result.isNotNull) {
        emit(DeliveryAndPaymentSuccess(orderDetails: result!));
      } else {
        emit(DeliveryAndPaymentError());
      }
    } on SocketException catch (_) {
      emit(DeliveryAndPaymentError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAndPaymentError());
    }
  }

  void ordersRegister(
      {bool loading = false, required BuildContext context}) async {
    try {
      if (loading) emit(DeliveryAndPaymentInProgress());
      Loader.show(context);
      final result = await OrdersProvider.orderRegister(addressGuid: null);
      if (result.statusCode.isSuccess) {
        Snack.positive(message: MyText.orderRegistered);
        //fetch(false);
      } else {
        emit(DeliveryAndPaymentError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAndPaymentError());
    }
    context.read<TabCountsCubit>().fetch(false);
    Loader.hide();
  }

  //values
  //photo
  final BehaviorSubject<PaymentType> paymentType =
      BehaviorSubject<PaymentType>.seeded(PaymentType.cash);

  Stream<PaymentType> get paymentTypeStream => paymentType.stream;

  updatePaymentType(PaymentType? value) {
    bbbb("update: $value");
    if (value.isNull) {
      paymentType.sink.addError(MyText.field_is_not_correct);
    } else {
      paymentType.sink.add(value!);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPaymentTypeIncorrect => (!paymentType.hasValue);
}
