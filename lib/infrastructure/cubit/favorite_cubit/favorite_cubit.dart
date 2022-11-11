import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../../utils/delegate/request_control.dart';
import '../../data/favorites_provider.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  int page = 1;
  fetchProduct([bool loading = true]) async {
    if (loading) {
      emit(FavoriteInProgress());
    }
    try {
      final result = await FavoritesProvider.getFavorite(page);
      wtf(result.data.toString());
      if (isSuccess(result.statusCode)) {
        print("Cubit 3");

        emit(FavoriteSuccess(result.data));
      } else {
        emit(FavoriteError());
      }
    } on SocketException catch (_) {
      emit(FavoriteError());
    } catch (e) {
      eeee("Fvorite Error" + e.toString());
      emit(FavoriteError());
    }
  }

// pagination() async {
//   try {
//     final result = await FavoritesProvider.getProduct(3);
//     iiii(result.toString());
//
//     if (result.data != null) {}
//   } catch (e) {}
// }
}
