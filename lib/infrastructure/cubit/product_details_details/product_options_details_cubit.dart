import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/product_options_provider.dart';
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
