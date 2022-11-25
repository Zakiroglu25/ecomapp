import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/public_provider.dart';
import 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  void getFaq([bool loading = true]) async {
    if (loading) {
      emit(FaqLoading());
    }
      final result = await PublicProvider.faq();
      print(result);
        emit(FaqSuccess(result.data));


  }

}