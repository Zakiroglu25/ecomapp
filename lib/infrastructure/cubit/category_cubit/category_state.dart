part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryInProgress extends CategoryState {}

class CategoryError extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryTree> category;

  CategorySuccess(this.category);
}
