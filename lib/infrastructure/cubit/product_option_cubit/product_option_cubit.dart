import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../data/product_options_provider.dart';
import '../../model/response/search_items.dart';
import 'product_option_state.dart';

class ProductOptionCubit extends Cubit<ProductOptionState> {
  ProductOptionCubit() : super(ProductOptionInitial()) {
    medSearchController = TextEditingController();
  }

  int page = 1;
  int totalPages = 0;
  List<SimpleProduct> products = [];

  late final TextEditingController medSearchController;

  fetchProduct({bool loading = true, String? title}) async {
    clearCache();
    if (loading) {
      emit(ProductOptionInProgress());
    }

    try {
      final result = await ProductOptionsProvider.getProduct(page,
          title: medSearchController.text);
      if (result.statusCode.isSuccess) {
        final searchItems = result.data;
        products.addAll(searchItems!.products!);
        totalPages = searchItems.totalPages!;
        updateHaveElse();
        emit(ProductOptionSuccess(products));
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

  void clearCache() {
    products.clear();
    page = 1;
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

  // void loadMore() async {
  //   if (state is PostsLoading) return;
  //
  //   final currentState = state;
  //
  //   var oldPosts = <SimpleProduct>[];
  //   if (currentState is ProductOptionSuccess) {
  //     oldPosts = currentState.productList;
  //   }
  //   emit(PostsLoading(oldPosts, isFirstFetch: page == 1));
  //   final result = await ProductOptionsProvider.getProduct(page++);
  //   final posts = (state as PostsLoading).oldList;
  //   if (result.data != null) {
  //     posts.addAll(result.data);
  //   }
  //
  //   emit(ProductOptionSuccess(posts));
  // }

  void loadMore() async {
    eeee("current page:  $page");
    if (page >= totalPages) return;
    final result = await ProductOptionsProvider.getProduct(page + 1,
        title: medSearchController.text);
    if (result.statusCode.isSuccess) {
      products.addAll(result.data!.products!);
      emit(ProductOptionSuccess(products));
      page++;
    }
    updateHaveElse();
  }

  //have else products checker
  final BehaviorSubject<bool> haveElse = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get haveElseStream => haveElse.stream;

  updateHaveElse() {
    if (page < totalPages) {
      haveElse.sink.add(true);
      return;
    }
    haveElse.sink.add(false);
  }
}
