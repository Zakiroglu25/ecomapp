import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../data/product_options_provider.dart';
import '../../model/remote/general/MyMessage.dart';
import '../../model/response/search_items.dart';
import 'product_details_state.dart';

class ProductOptionDetailsCubit extends Cubit<ProductOptionDetailsState> {
  ProductOptionDetailsCubit() : super(ProductODetailsInitial());
  int page = 1;
  int totalPages = 0;
  List<SimpleProduct> products = [];

  fetchProduct(String guid) async {
    emit(ProductODetailsInProgress());
    try {
      final result = await ProductOptionsProvider.getProductByGuid(guid: guid);
      if (result.data != null) {
        emit(ProductODetailsSuccess(result.data));
      } else {
        emit(ProductODetailsError());
        eeee(
          "contact result bad: ${ResponseMessage.fromJson(
            jsonDecode(
              result.toString(),
            ),
          ).message}",
        );
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(ProductODetailsError());
    }
  }

  fetchProductMapGuid(String guid) async {
    clearCache();
    emit(ProductODetailsInProgress());

    try {
      final result = await ProductOptionsProvider.getProductByGuidForMap(
          guid: guid, page: page);
      if (result.statusCode.isSuccess) {
        final searchItems = result.data;
        products.addAll(searchItems!.products!);
        totalPages = searchItems.totalPages!;
        updateHaveElse();
        emit(ProductODetailsMapListSuccess(products));
      } else {
        emit(ProductODetailsError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(ProductODetailsError());
    }
  }

  void clearCache() {
    products.clear();
    page = 1;
  }

  void loadMore(String guid) async {
    eeee("current page:  $page");
    if (page >= totalPages) return;
    final result = await ProductOptionsProvider.getProductByGuidForMap(
        page: page + 1, guid: guid);
    if (result.statusCode.isSuccess) {
      products.addAll(result.data!.products!);
      emit(ProductODetailsMapListSuccess(products));
      page++;
    }
    updateHaveElse();
  }

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
