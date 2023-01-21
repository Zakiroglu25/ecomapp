import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../data/product_options_provider.dart';
import '../../model/remote/general/MyMessage.dart';
import 'product_details_state.dart';

class ProductOptionDetailsCubit extends Cubit<ProductOptionDetailsState> {
  ProductOptionDetailsCubit() : super(ProductODetailsInitial());

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
}
