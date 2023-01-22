import '../../model/response/product_option_details_model.dart';
import '../../model/response/product_option_model.dart';
import '../../model/response/search_items.dart';

abstract class ProductOptionDetailsState {}

class ProductODetailsInitial extends ProductOptionDetailsState {}

class ProductODetailsInProgress extends ProductOptionDetailsState {}

class ProductODetailsError extends ProductOptionDetailsState {
  String? error;

  ProductODetailsError({this.error});
}

class ProductODetailsNetworkError extends ProductOptionDetailsState {}

class ProductODetailsMapListSuccess extends ProductOptionDetailsState {
  final List<SimpleProduct>? productList;

  ProductODetailsMapListSuccess(this.productList);
}

class ProductODetailsSuccess extends ProductOptionDetailsState {
  ProductODetailsSuccess(this.productDetails);

  final ProductDetails? productDetails;
}
