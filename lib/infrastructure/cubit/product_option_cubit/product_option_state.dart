import '../../model/response/product_option_model.dart';

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
