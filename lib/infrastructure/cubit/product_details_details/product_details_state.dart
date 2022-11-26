import '../../model/response/product_option_details_model.dart';
import '../../model/response/product_option_model.dart';

abstract class ProductOptionDetailsState {}

class ProductODetailsInitial extends ProductOptionDetailsState {}

class ProductODetailsInProgress extends ProductOptionDetailsState {}

class ProductODetailsError extends ProductOptionDetailsState {
  String? error;

  ProductODetailsError({this.error});
}

class ProductODetailsNetworkError extends ProductOptionDetailsState {}

class ProductODetailsSuccess extends ProductOptionDetailsState {
  ProductODetailsSuccess(this.product_o_d_model);

  final FavResult? product_o_d_model;
}
