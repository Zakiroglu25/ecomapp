import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/infrastructure/model/response/card_model.dart';
import 'package:uikit/infrastructure/services/hive_service.dart';
import 'package:uikit/locator.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/my_printer.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';
import 'package:uikit/utils/delegate/user_operations.dart';
import 'package:uikit/utils/enums/delivery_type.dart';
import 'package:uikit/utils/enums/payment_type.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/screen/snack.dart';

import '../../../utils/screen/overlay_loader.dart';
import '../../data/address_provider.dart';
import '../../data/orders_provider.dart';
import '../../model/response/address_model.dart';
import 'delivery_and_payment_state.dart';

class DeliveryAndPaymentCubit extends Cubit<DeliveryAndPaymentState> {
  DeliveryAndPaymentCubit() : super(DeliveryAndPaymentInitial());

  HiveService get _prefs => locator<HiveService>();

  String orderGuid = '';
  String? addressGuid;
  int tabIndex = 0;

  fetch({bool loading = true, String? guid}) async {
    bbbb("tesssss");
    if (loading) {
      emit(DeliveryAndPaymentInProgress());
    }
    if (guid.isNotNull) orderGuid = guid!;
    try {
      await fetchMainAddress();
      final result = await OrdersProvider.orderDetails(guid: orderGuid);
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

  updateDeliveryType({bool loading = true, required int index}) async {
    if (loading) {
      emit(DeliveryAndPaymentInProgress());
    }
    try {
      if (addressGuid.isNull) return;
      final result = await OrdersProvider.updateOrderDetails(
        guid: orderGuid,
        addressGuid: addressGuid,
        paymentType: paymentType.valueOrNull?.toValue,
        deliveryType: DeliveryType.fromIndex(index),
      );
      if (result.isSuccess) {
        //orderGuid = guid;
        // emit(DeliveryAndPaymentSuccess(orderDetails: result!));
        fetch(guid: orderGuid);
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

  Future<void> fetchMainAddress(
      {bool andUpdate = false, bool loading = true}) async {
    if (loading) emit(DeliveryAndPaymentInProgress());
    try {
      List<Address> result = await AddressProvider.getAddresses();
      final Address? address =
          result.where((element) => element.isMain == true).firstOrNull;
      if (address.isNull) {
        emit(DeliveryAndPaymentError(error: MyText.emptyDeliveryAddressDesc));
        return;
      }
      addressGuid = address!.guid!;
      if (andUpdate) {
        updateDeliveryType(index: tabIndex);
      }
      return;
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAndPaymentError());
    }
  }

  updateInsuranceCheckedIn({bool loading = true, required bool value}) async {
    if (loading) {
      emit(DeliveryAndPaymentInProgress());
    }
    try {
      final result = await OrdersProvider.changeNotCovered(
          guid: orderGuid, include: value);
      // if (result.isNotNull) {
      //   //orderGuid = guid;
      //   emit(DeliveryAndPaymentSuccess(orderDetails: result!));
      // } else {
      //   emit(DeliveryAndPaymentError());
      // }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      //   emit(DeliveryAndPaymentError());
    } finally {
      fetch(guid: orderGuid);
    }
  }

  updateTab({required int index}) async {
    tabIndex = index;
    updateDeliveryType(index: index);
    if (index == 0 && paymentType.valueOrNull == PaymentType.CASH) {
      updatePaymentType(null);
    }
  }

  void createOrderPayment(
      {bool loading = false, required BuildContext context}) async {
    try {
      if (loading) emit(DeliveryAndPaymentInProgress());
      Loader.show(context);
      final result = await OrdersProvider.createPayment(
          orderGuid: orderGuid,
          saveCard: checkbox.valueOrNull,
          // paymentType: paymentType.valueOrNull?.toValue,
          // deliveryType: deliveryType.toText,
          cardGuid: selectedCard.valueOrNull?.guid,
          comment: comment.valueOrNull);
      //result?.url = null;
      if (result.isNull) {
        emit(DeliveryAndPaymentOperationError());
        Loader.hide();
        return;
      }
      if (result!.url.isNull) {
        Go.pop(context);
        Snack.positive(message: MyText.success);
        return;
      } else {
        emit(DeliveryAndPaymentUrlFetched(url: result.url!));
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAndPaymentOperationError());
    }
    //context.read<TabCountsCubit>().fetch(false);
    Loader.hide();
  }

  void paymentSuccess(
    BuildContext context, {
    bool loading = true,
  }) async {
    if (loading) {
      emit(DeliveryAndPaymentInProgress());
    }
    try {
      await UserOperations.configUserDataWhenOpenApp(
          accessToken: _prefs.accessToken, fcm: _prefs.fcmToken);
      //emit(DeliveryAndPaymentSuccess(orderDetails: orderDetails));
      Snack.positive(context: context, message: MyText.success);
      Go.pop(context);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAndPaymentError());
    }
  }

  void paymentUnSuccess(
    BuildContext context, {
    bool loading = true,
  }) async {
    if (loading) {
      emit(DeliveryAndPaymentInProgress());
    }
    try {
      await UserOperations.configUserDataWhenOpenApp(
          accessToken: _prefs.accessToken, fcm: _prefs.fcmToken);
      //emit(DeliveryAndPaymentSuccess(orderDetails: orderDetails));
      Snack.display(context: context, message: MyText.error);
      Go.pop(context);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(DeliveryAndPaymentError());
    }
  }

  final BehaviorSubject<CardData> selectedCard = BehaviorSubject<CardData>();

  Stream<CardData> get selectedCardStream => selectedCard.stream;

  updateSelectedCard(CardData? value) {
    bbbb("updateSelectedCard: $value");
    if (value.isNull) {
      selectedCard.sink.addError(MyText.field_is_not_correct);
      selectedCard.sink.add(CardData());
      return;
    }
    if (value == selectedCard.valueOrNull) {
      selectedCard.sink.add(CardData());
    } else {
      selectedCard.sink.add(value!);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isSelectedCardIncorrect => (!selectedCard.hasValue);

  //paymentType
  final BehaviorSubject<PaymentType> paymentType =
      BehaviorSubject<PaymentType>.seeded(PaymentType.ONLINE);

  Stream<PaymentType> get paymentTypeStream => paymentType.stream;

  updatePaymentType(PaymentType? value) {
    bbbb("update: $value");
    if (value.isNull) {
      paymentType.sink.addError(MyText.field_is_not_correct);
    }
    // if (value == paymentType.value) {
    //   paymentType.sink.add(PaymentType.unselected);
    // }
    else {
      paymentType.sink.add(value!);
    }
    // if (value == PaymentType.cash) {
    //   updateSelectedCard(null);
    // }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isPaymentTypeIncorrect => (!paymentType.hasValue);

  //name
  final BehaviorSubject<String> comment = BehaviorSubject<String>();

  Stream<String> get commentStream => comment.stream;

  updateComment(String value) {
    if (value.isEmpty) {
      comment.value = '';
      comment.sink.addError("Xana doldurulmalıdır");
    } else {
      comment.sink.add(value);
    }
    //  isUserInfoValid();
  }

  bool get isCommentIncorrect => (!comment.hasValue || comment.value.isEmpty);

  //checkbox card
  final BehaviorSubject<bool> checkbox = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get checkBoxStream => checkbox.stream;

  updateCheckBox(bool value) {
    checkbox.sink.add(value);
    //}
    // isUserInfoValid();
  }

  inverseCheckBox() {
    checkbox.sink.add(!checkbox.value);
    //}
    //   isUserInfoValid();
  }

  bool get isCheckBoxIncorrect =>
      (!checkbox.hasValue || checkbox.value == null || checkbox.value == false);

  @override
  emit(DeliveryAndPaymentState state) {
    if (!isClosed) return super.emit(state);
  }
}
