import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/product_options_provider.dart';
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
