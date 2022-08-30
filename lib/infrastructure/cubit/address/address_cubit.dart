import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../../utils/delegate/my_printer.dart';
import '../../data/address_provider.dart';
import '../../model/remote/general/MyMessage.dart';
import '../../services/hive_service.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  HiveService get _prefs => locator<HiveService>();

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(AddressInProgress());
    }
    iiii("cubit 1");
    try {
      final result =
          await AddressProvider.getAddresses(token: _prefs.accessToken);
      iiii("cubit 2");
      wtf(result.toString());
      if (result!.statusCode == 200) {
        emit(AddressSuccess(result.data));
      } else {
        emit(AddressError());
        eeee(
            "address result bad: ${ResponseMessage.fromJson(jsonDecode(result.toString())).message}");
      }
    } on SocketException catch (_) {
      //network olacaq
      emit(AddressNetworkError());
    } catch (e) {
      eeee("address catch: $e".toString());
      emit(AddressError(error: e.toString()));
    }
  }
}
