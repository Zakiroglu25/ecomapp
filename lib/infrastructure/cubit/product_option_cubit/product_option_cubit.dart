import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/product_option_model.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/product_options_provider.dart';
import 'product_option_state.dart';

class ProductOptionCubit extends Cubit<ProductOptionState> {
  ProductOptionCubit() : super(ProductOptionInitial()) {
    medSearchController = TextEditingController();
  }
  bool _loadMoreActivated = false;
  int page = 1;
  late final TextEditingController medSearchController;

  fetchProduct({bool loading = true, String? title}) async {
    _loadMoreActivated = false;
    if (loading) {
      emit(ProductOptionInProgress());
    }
    try {
      final result = await ProductOptionsProvider.getProduct(page,
          title: medSearchController.text);
      if (isSuccess(result.statusCode)) {
        emit(ProductOptionSuccess(result.data));
      } else {
        emit(ProductOptionError());
      }
    } on SocketException catch (_) {
      emit(ProductOptionError());
    } catch (e) {
      eeee("Product Option Error" + e.toString());
      emit(ProductOptionError());
    }
  }

  // fetchByGuid({required String guid, bool loading = true}) async {
  //   _loadMoreActivated = false;
  //   if (loading) {
  //     emit(ProductOptionInProgress());
  //   }
  //   try {
  //     final result = await ProductOptionsProvider.getProductByGuid(guid: guid);
  //     if (result.statusCode.isSuccess) {
  //       emit(ProductOptionSuccess(result.data));
  //     } else {
  //       emit(ProductOptionError());
  //     }
  //   } on SocketException catch (_) {
  //     emit(ProductOptionError());
  //   } catch (e) {
  //     eeee("Product Option Error" + e.toString());
  //     emit(ProductOptionError());
  //   }
  // }

  Future<void> loadMore() async {
    if (_loadMoreActivated) {
      return;
    }

    try {
      if (state is! ProductOptionSuccess) {
        return;
      }

      _loadMoreActivated = true;

      final successState = (state as ProductOptionSuccess);
      // emit(successState.copyWith(showBottomLoading: true));

      final result = await ProductOptionsProvider.getProduct(2);

      List<SimpleProduct> modelsList = successState.productList;

      if (result.data != null) {
        modelsList.addAll(result.data);
      }
      emit(ProductOptionSuccess(modelsList));
      _loadMoreActivated = false;
    } catch (e) {
      _loadMoreActivated = false;
      if (state is ProductOptionSuccess) {
        emit(state);
      }
    }
  }
}
