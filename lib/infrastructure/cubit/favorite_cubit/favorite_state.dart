import 'package:uikit/infrastructure/model/response/search_items.dart';

import '../../model/response/product_option_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteInProgress extends FavoriteState {}

class FavoriteAdding extends FavoriteState {}

class FavoriteNotAdding extends FavoriteState {}

class FavoriteError extends FavoriteState {
  String? error;

  FavoriteError({this.error});
}

class FavoriteNetworkError extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  FavoriteSuccess(this.searchItems);
  final SearchItems searchItems;
}
