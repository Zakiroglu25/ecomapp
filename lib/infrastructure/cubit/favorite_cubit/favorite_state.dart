
import '../../model/response/favorite_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteInProgress extends FavoriteState {}

class FavoriteError extends FavoriteState {
  String? error;

  FavoriteError({this.error});
}

class FavoriteNetworkError extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  FavoriteSuccess(this.product_option_model);
  final List<Data> product_option_model;
}
