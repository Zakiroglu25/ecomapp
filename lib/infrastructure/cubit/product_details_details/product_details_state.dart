import 'package:doctoro/infrastructure/model/response/address_model.dart';
import 'package:doctoro/infrastructure/model/response/product_option_model.dart';

abstract class ProductOptionDetailsState {}

class ProductOptionInitial extends ProductOptionDetailsState {}

class ProductOptionInProgress extends ProductOptionDetailsState {}

class ProductOptionError extends ProductOptionDetailsState {
  String? error;

  ProductOptionError({this.error});
}

class ProductOptionNetworkError extends ProductOptionDetailsState {}

class ProductOptionSuccess extends ProductOptionDetailsState {
  ProductOptionSuccess(this.product_option_model);

  final List<Data> product_option_model;
}
