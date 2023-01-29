import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/screen/snack.dart';

import '../../../utils/delegate/file_operations.dart';
import '../../../utils/enums/operation_type.dart';
import '../../../utils/screen/alert.dart';
import '../../../utils/screen/overlay_loader.dart';
import '../../data/cart_provider.dart';
import '../../data/images_provider.dart';
import '../../data/orders_provider.dart';
import '../tab_counts/tab_counts_cubit.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int page = 1;

  fetch([bool loading = true]) async {
    // updateProducts([]);
    if (loading) {
      emit(CartInProgress());
    }
    try {
      final result = await CartProvider.getCartItems();
      if (result.statusCode.isSuccess) {
        final cartItems = result.data;
        // updateProducts(cartItems);
        emit(CartFetched(cartItems));
      } else {
        emit(CartError());
      }
    } on SocketException catch (_) {
      emit(CartError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }

  void add(String? guid) async {
    try {
      final result = await CartProvider.addCart(itemGuid: guid, amount: 1);
      if (result.statusCode.isSuccess) {
        Snack.positive(message: MyText.addedToCart);
        fetch(false);
      } else {
        emit(CartOperationError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }

  void updateInCart(String? guid,
      {required int amount,
      required BuildContext context,
      required OperationType operationType}) async {
    Loader.show(context);
    try {
      final netAmount =
          operationType == OperationType.add ? amount + 1 : amount - 1;
      final result =
          await CartProvider.addCart(itemGuid: guid, amount: netAmount);
      if (result.statusCode.isSuccess) {
        // emit(CartAdding());
        Snack.positive(message: MyText.success);
        fetch(false);
      } else {
        emit(CartOperationError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
    Loader.hide();
  }

  void delete(String? stockGuid,
      {bool isCart = false, bool inCart = false}) async {
    try {
      final result = await CartProvider.deleteCart(guid: stockGuid!);
      if (result.statusCode.isSuccess) {
        Snack.display(message: MyText.removedFromCart, color: MyColors.brand);
        fetch(false);
      } else {
        emit(CartOperationError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }

  void ordersRegister(
      {bool loading = false, required BuildContext context}) async {
    try {
      if (loading) emit(CartInProgress());
      Loader.show(context);
      final result = await OrdersProvider.orderRegister(addressGuid: null);
      if (result.statusCode.isSuccess) {
        Snack.positive(message: MyText.orderRegistered);
        fetch(false);
      } else {
        emit(CartOperationError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
    context.read<TabCountsCubit>().fetch(false);
    Loader.hide();
  }

  void deletePrescription(BuildContext context, String cartGuid,
      {bool loading = true}) async {
    if (loading) emit(CartInProgress());
    Loader.show(context);
    try {
      final result = await CartProvider.deleteCartPrescription(guid: cartGuid);
      if (result.statusCode.isSuccess) {
        // emit(CartDeleted());
        Snack.display(
            message: MyText.cartPrescriptionRemoved, color: MyColors.brand);
        fetch(false);
      } else {
        Snack.display(message: MyText.error, color: MyColors.brand);
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
    Loader.hide();
  }

  void checkAndPickImage(BuildContext context,
      {required ImageSource imageSource, required String? cartGuid}) async {
    Loader.show(context);
    try {
      await updateImage(await FileOperations.checkAndPickImage(
          context: context, imageSource: imageSource));
      await addPrescription(cartGuid: cartGuid!, context: context);
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      Snack.display(context: context, message: e.toString());
    }
    Loader.hide();
  }

  Future<void> showGalleryAccessAlert(BuildContext context) async {
    Alert.show(context,
        title: MyText.we_need_access_to_gallery,
        content: MyText.we_will_redirect_to_settings_gallery,
        buttonText: MyText.goOn,
        onTap: () async => await openAppSettings());
  }

  addPrescription({
    required BuildContext context,
    bool? isLoading = false,
    required String cartGuid,
  }) async {
    if (isLoading!) {
      emit(CartInProgress());
    }
    try {
      final guid = await addImage(isLoading: false);
      if (guid == null) {
        //emit(CartError());

        return;
      } else {
        final response = await CartProvider.addCartPrescription(
            cartGuid: cartGuid, prescriptionGuid: guid);

        if (response.statusCode.isSuccess) {
          Snack.positive(message: MyText.success);
          //emit(CartPrescriptionAdded());

          fetch(false);
        } else {
          Snack.display(message: MyText.error);
          emit(CartOperationError());
        }
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }

  Future<String?> addImage({bool isLoading = true}) async {
    if (isLoading) {
      emit(CartInProgress());
    }
    try {
      if (!isImageIncorrect) {
        final response =
            await ImagesProvider.addPrescription(invoice: image.valueOrNull);

        if (response!.statusCode.isSuccess)
          return response.data;
        else {
          Snack.display(message: MyText.error);
          emit(CartOperationError());
        }
      } else {
        emit(CartOperationError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
    return null;
  }

  //values
  //photo
  final BehaviorSubject<File?> image = BehaviorSubject<File>();

  Stream<File?> get imageStream => image.stream;

  updateImage(File? value) {
    if (value == null || value.path == null) {
      image.sink.addError(MyText.field_is_not_correct);
    } else {
      image.sink.add(value);
    }
    // isUserInfoValid(registerType: _registerType);
  }

  bool get isImageIncorrect => (!image.hasValue || image.value == null);
}
