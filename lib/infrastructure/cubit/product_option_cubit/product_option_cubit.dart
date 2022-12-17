import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/product_option_model.dart';

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
      wtf(result.data.toString());
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

  void loadMore() async {
    if (state is PostsLoading) return;

    final currentState = state;

    var oldPosts = <SimpleProduct>[];
    if (currentState is ProductOptionSuccess) {
      oldPosts = currentState.productList;
    }
    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));
    final result = await ProductOptionsProvider.getProduct(page++);
    final posts = (state as PostsLoading).oldList;
    if (result.data != null) {
      posts.addAll(result.data);
    }


    emit(ProductOptionSuccess(posts));
  }
}
