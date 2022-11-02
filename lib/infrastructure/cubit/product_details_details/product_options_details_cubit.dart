import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/product_options_provider.dart';
import '../../model/remote/general/MyMessage.dart';
import 'product_details_state.dart';

class ProductOptionDetailsCubit extends Cubit<ProductOptionDetailsState> {
  ProductOptionDetailsCubit() : super(ProductODetailsInitial());
  bool paginationActive = false;
  int page = 1;

  fetchProduct(String guid) async {
    emit(ProductODetailsInProgress());
    try {
      final result = await ProductOptionsProvider.getByGuid(guid);
      if (result!.guid != null) {
        emit(ProductODetailsSuccess(result));
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
}
