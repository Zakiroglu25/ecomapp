import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/delegate/my_printer.dart';
import '../../data/public_provider.dart';
import '../../model/remote/general/MyMessage.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  void fetch([bool loading = true]) async {
    if (loading) {
      emit(ContactInProgress());
    }
    print("1");
    try {
      final result = await PublicProvider.getContact();
      if (result != null) {
        print("2");
        emit(ContactSuccess(result.data));
      } else {
        emit(ContactError());
        eeee(
            "contact result bad: ${ResponseMessage.fromJson(jsonDecode(result.toString())).message}");
      }
      print("3");
    } on SocketException catch (_) {
      //network olacaq
      emit(ContactNetworkError());
    } catch (e) {
      eeee("contact cubit catch: $e".toString());
      emit(ContactError(error: e.toString()));
    }
  }
}
