import '../../model/response/faq_model.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqProgress extends FaqState {}

class FaqLoading extends FaqState {}

class FaqError extends FaqState {
  String? error;

  FaqError({this.error});
}

class FaqNetworkError extends FaqState {}

class FaqSuccess extends FaqState {
  FaqSuccess(this.faqList);

  final FaqModel faqList;
}
