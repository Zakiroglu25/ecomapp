import 'dart:io';

import 'package:doctoro/utils/delegate/my_printer.dart';
import 'package:doctoro/utils/delegate/request_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/product_options_provider.dart';
import '../../model/response/product_option_model.dart';
import 'product_details_state.dart';

class ProductOptionDetailsCubit extends Cubit<ProductOptionDetailsState> {
  ProductOptionDetailsCubit() : super(ProductODetailsInitial());
  bool paginationActive = false;
  int page = 1;

  fetchProduct(String guid) async {
    wtf("cubit");

    try {
      wtf("cubit1");
      final result = await ProductOptionsProvider.getByGuid(guid);
      wtf("cubit2");
      wtf("cubit"+result.statusCode.toString());
      if (isSuccess(result.statusCode)) {
        emit(ProductODetailsSuccess(result.data));
      } else {
        emit(ProductODetailsError());
      }
    } on SocketException catch (_) {
      emit(ProductODetailsError());
    } catch (e) {
      eeee("Product Option Error" + e.toString());
      emit(ProductODetailsError());
    }
  }
}
