import '../../model/response/cart_counts.dart';

abstract class TabCountsState {}

class TabCountsInitial extends TabCountsState {}

class TabCountsInProgress extends TabCountsState {}

class TabCountsError extends TabCountsState {
  String? error;
  TabCountsError({this.error});
}

class TabCountsSuccess extends TabCountsState {
  TabCounts? tabCounts;
  TabCountsSuccess({required this.tabCounts});
}
