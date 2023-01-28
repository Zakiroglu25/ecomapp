import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
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
    } on SocketException catch (_) {
      emit(ProductODetailsError());
    } catch (e) {
      eeee("Product Option Error" + e.toString());
      emit(ProductODetailsError());
    }
  }

  fetchProductMapGuid(String guid) async {
    emit(ProductODetailsInProgress());

    try {
      final result =
          await ProductOptionsProvider.getProductByGuidForMap(guid: guid, page: page);
      if (result.statusCode.isSuccess) {
        final searchItems = result.data;
        products.addAll(searchItems!.products!);
        totalPages = searchItems.totalPages!;
        emit(ProductODetailsMapListSuccess(products));
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
    } on SocketException catch (_) {
      emit(ProductODetailsError());
    } catch (e) {
      eeee("Product Option Error" + e.toString());
      emit(ProductODetailsError());
    }
  }

  void loadMore(String guid) async {
    eeee("current page:  $page");
    final result = await ProductOptionsProvider.getProductByGuidForMap(
        page: page + 1, guid: guid);
    if (result.statusCode.isSuccess) {
      products.addAll(result.data!.products!);
      emit(ProductODetailsMapListSuccess(products));
      page++;
    }
  }
}
