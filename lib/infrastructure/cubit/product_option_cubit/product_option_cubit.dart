import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/product_options_provider.dart';
import 'product_option_state.dart';

class ProductOptionCubit extends Cubit<ProductOptionState> {
  ProductOptionCubit() : super(ProductOptionInitial());
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

  fetchByGuid({required String guid, bool loading = true}) async {
    paginationActive = false;
    if (loading) {
      emit(ProductOptionInProgress());
    }
    try {
      final result = await ProductOptionsProvider.getProductByGuid(guid: guid);
      if (result.statusCode.isSuccess) {
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

  pagination() async {
    try {
      final result = await ProductOptionsProvider.getProduct(3);
      iiii(result.toString());

      if (result.data != null) {}
    } catch (e) {}
  }
}
