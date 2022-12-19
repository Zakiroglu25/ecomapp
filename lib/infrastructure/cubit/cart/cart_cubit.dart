import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/utils/screen/snack.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/enums/transaction_type.dart';
import '../../data/cart_provider.dart';
import '../../data/favorites_provider.dart';
import '../../model/response/product_option_model.dart';
import '../../model/response/search_items.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int page = 1;
  //List<SimpleProduct> products = [];
  final BehaviorSubject<List<SimpleProduct>> products =
      BehaviorSubject<List<SimpleProduct>>.seeded([]);

  Stream<List<SimpleProduct>> get productsStream => products.stream;

  updateProducts(List<SimpleProduct> value) {
    if (value.isEmpty) {
      products.valueOrNull?.clear();
      //products.sink.addError(MyText.all_fields_must_be_filled);
    } else {
      products.sink.add(value);
    }
  }

  fetch([bool loading = true]) async {
    // updateProducts([]);
    if (loading) {
      emit(CartInProgress());
    }
    try {
      final result = await CartProvider.getCart();
      if (result.statusCode.isSuccess) {
        final favRes = result.data as SearchItems;
        updateProducts(favRes.products!);
        emit(CartSuccess(favRes));
      } else {
        emit(CartError());
      }
    } on SocketException catch (_) {
      emit(CartError());
    } catch (e) {
      eeee("Fvorite Error" + e.toString());
      emit(CartError());
    }
  }

  void add(String? guid, {bool isCart = false, bool inCart = false}) async {
    try {
      if (isCart && inCart) {
        updateProducts(products.value
          ..remove(products.value
              .where((element) => element.guid == guid)
              .firstOrNull));
      }
      final result = await CartProvider.addCart(itemGuid: guid, amount: 1);
      if (result.statusCode.isSuccess) {
        emit(CartAdding());
        Snack.positive(message: MyText.addToCart);
        fetch(false);
      } else {
        emit(CartNotAdding());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }

  void delete(String? guid, {bool isCart = false, bool inCart = false}) async {
    try {
      if (isCart && inCart) {
        updateProducts(products.value
          ..remove(products.value
              .where((element) => element.guid == guid)
              .firstOrNull));
      }
      final result = await CartProvider.deleteCart(guid: guid!);
      if (result.statusCode.isSuccess) {
        emit(CartDeleted());
        Snack.positive(message: MyText.addToCart);
        fetch(false);
      } else {
        emit(CartNotAdding());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }
}
