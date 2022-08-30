import 'package:bloc/bloc.dart';
import 'package:doctoro/utils/delegate/my_printer.dart';

import '../../../locator.dart';
import '../../../utils/delegate/user_operations.dart';
import '../../services/hive_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  HiveService get _prefs => locator<HiveService>();

  void getUserData({bool? isLoading = true}) async {
    if (isLoading!) {
      emit(UserLoading());
    }
    try {
      await UserOperations.configUserDataWhenOpenApp(
        // fcmToken: _prefs.fcmToken,
        accessToken: _prefs.accessToken!,
        //  path: _prefs.userPath
      );
    } catch (e, s) {
      eeee(e.toString());
    }
  }
}
