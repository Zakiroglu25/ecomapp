import 'dart:io';

import 'package:doctoro/utils/delegate/my_printer.dart';
import 'package:doctoro/utils/delegate/request_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/product_options_provider.dart';
import '../../model/response/product_option_model.dart';
import 'product_details_state.dart';

class ProductOptionDetailsCubit extends Cubit<ProductOptionDetailsState> {
  ProductOptionDetailsCubit() : super(ProductOptionInitial());
  bool paginationActive = false;
  int page = 1;

  fetchProduct([bool loading = true]) async {
    paginationActive = false;
    if (loading) {
      emit(ProductOptionInProgress());
    }
    try {
      final result = await ProductOptionsProvider.getProduct(page);
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
}
