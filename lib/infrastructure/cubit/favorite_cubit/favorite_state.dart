import '../../model/response/product_option_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteInProgress extends FavoriteState {}

class FavoriteError extends FavoriteState {
  String? error;

  FavoriteError({this.error});
}

class FavoriteNetworkError extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  FavoriteSuccess(this.favResult);
  final FavResult favResult;
}
