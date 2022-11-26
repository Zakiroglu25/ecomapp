import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../config/recorder.dart';
import '../../data/category_provider.dart';
import '../../model/response/category_tree.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(CategoryInProgress());
    }
    try {
      List<CategoryTree> categories = [];
      final result = await CategoryProvider.getCategoryTree();
      if (result.statusCode.isSuccess && result.data.isNotEmptyOrNull) {
        for (CategoryTree subCat in result.data!) {
          if (subCat.subcategories.isEmptyOrNull) continue;
          for (CategoryTree subCat2 in subCat.subcategories!) {
            if (subCat2.subcategories.isEmptyOrNull) continue;
            categories.addAll(subCat2.subcategories!);
          }
        }
        emit(CategorySuccess(categories));
      } else {
        emit(CategoryError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(CategoryError());
    }
  }
}
