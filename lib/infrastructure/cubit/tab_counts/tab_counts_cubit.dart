import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/config/recorder.dart';
import 'package:uikit/infrastructure/data/content_provider.dart';
import 'package:uikit/utils/extensions/object.dart';

import 'tab_counts_state.dart';

class TabCountsCubit extends Cubit<TabCountsState> {
  TabCountsCubit() : super(TabCountsInitial());

  int currentTab = 0;

  fetch([bool loading = true]) async {
    if (loading) {
      emit(TabCountsInProgress());
    }
    try {
      final result = await ContentProvider.getTabCounts();
      if (result.isNotNull) {
        emit(TabCountsSuccess(tabCounts: result));
      } else {
        emit(TabCountsError());
      }
    } catch (e, s) {
      Recorder.recordCatchError(e, s);
      emit(TabCountsError());
    }
  }

  setCurrentTab(int index) async {
    currentTab = index;
  }
}
