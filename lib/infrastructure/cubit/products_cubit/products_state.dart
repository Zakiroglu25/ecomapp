import '../../model/response/search_items.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsInProgress extends ProductsState {}

class ProductsError extends ProductsState {
  String? error;
  ProductsError({this.error});
}

class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.productList);
  final List<SimpleProduct> productList;
}

class ProductsSuccess2 extends ProductsSuccess {
  ProductsSuccess2(this.productList) : super(productList);
  final List<SimpleProduct> productList;
}
