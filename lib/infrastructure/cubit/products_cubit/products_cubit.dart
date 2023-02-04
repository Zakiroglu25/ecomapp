import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/infrastructure/cubit/products_cubit/index.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../data/product_options_provider.dart';
import '../../model/response/search_items.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    medSearchController = TextEditingController();
  }

  int page = 1;
  int totalPages = 0;
  List<SimpleProduct> products = [];

  late final TextEditingController medSearchController;
  late final FocusNode searchFocus = FocusNode();

  fetchProduct({bool loading = true, String? title}) async {
    clearCache();
    if (loading) {
      emit(ProductsInProgress());
    }

    try {
      final result = await ProductOptionsProvider.getProduct(page,
          title: medSearchController.text);
      if (result.statusCode.isSuccess) {
        final searchItems = result.data;
        products.addAll(searchItems!.products!);
        totalPages = searchItems.totalPages!;
        updateHaveElse();
        emit(ProductsSuccess(products));
      } else {
        emit(ProductsError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(ProductsError());
    }
  }

  void clearCache() {
    products.clear();
    page = 1;
  }

  void loadMore() async {
    eeee("current page:  $page");
    if (page >= totalPages) return;
    final result = await ProductOptionsProvider.getProduct(page + 1,
        title: medSearchController.text);
    if (result.statusCode.isSuccess) {
      products.addAll(result.data!.products!);
      emit(ProductsSuccess(products));
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
}
