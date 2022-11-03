import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uikit/infrastructure/model/response/status_dynamic.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../data/category_provider.dart';
import '../../model/response/category_tree.dart';

part 'get_category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(CategoryInProgress());
    }
    iiii("Cubit 0");
    try {
      iiii("Cubit 0.5");
      final result = await CategoryProvider.getCategoryTree();
      iiii("Cubit 1");
      if (isSuccess(result.statusCode)) {
        iiii("Cubit 2");
        emit(CategorySuccess(result.data));
      } else {
        iiii("Cubit 3");
        emit(CategoryError());
      }
    } catch (e) {
      iiii("Cubit 4");
      eeee("get category Tree catch: $e");
      emit(CategoryError());
    }
  }
}
