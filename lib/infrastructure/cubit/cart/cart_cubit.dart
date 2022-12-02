import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/enums/transaction_type.dart';
import '../../data/favorites_provider.dart';
import '../../model/response/product_option_model.dart';
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

  fetchProduct([bool loading = true]) async {
    // updateProducts([]);
    if (loading) {
      emit(CartInProgress());
    }
    try {
      final result = await FavoritesProvider.getFavorite(page);
      if (result.statusCode.isSuccess) {
        final favRes = result.data as FavResult;
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

  void addFavorite(String? guid,
      {bool isFav = false, bool inFav = false}) async {
    try {
      if (isFav && inFav) {
        updateProducts(products.value
          ..remove(products.value
              .where((element) => element.guid == guid)
              .firstOrNull));
      }
      final result = await FavoritesProvider.addFavorite(guid!,
          trnType: isFav ? TrnType.delete : TrnType.post);
      if (result.statusCode.isSuccess) {
        emit(CartAdding());
        fetchProduct(false);
      } else {
        emit(CartNotAdding());
      }
    } on SocketException catch (_) {
      emit(CartError());
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CartError());
    }
  }
}
