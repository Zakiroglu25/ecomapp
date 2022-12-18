import '../../model/response/product_option_model.dart';
import '../../model/response/search_items.dart';

abstract class ProductOptionState {}

class ProductOptionInitial extends ProductOptionState {}

class ProductOptionInProgress extends ProductOptionState {}

class ProductOptionError extends ProductOptionState {
  String? error;

  ProductOptionError({this.error});
}

class ProductOptionNetworkError extends ProductOptionState {}

class ProductOptionSuccess extends ProductOptionState {
  ProductOptionSuccess(this.productList);
  final List<SimpleProduct> productList;
}

class PostsLoading extends ProductOptionState {
  final List<SimpleProduct> oldList;
  final bool isFirstFetch;

  PostsLoading(this.oldList, {this.isFirstFetch = false});
}
