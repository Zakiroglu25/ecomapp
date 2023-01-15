import '../../model/response/insurance_model.dart';

abstract class InsuranceState {}

class InsuranceInitial extends InsuranceState {}

class InsuranceProgress extends InsuranceState {}

class InsuranceDelete extends InsuranceState {}

class InsuranceLoading extends InsuranceState {}
class InsuranceButtonActive extends InsuranceState {}

class InsuranceError extends InsuranceState {
  String? error;

  InsuranceError({this.error});
}

class AddInsuranceSuccess extends InsuranceState {
  String? error;

  AddInsuranceSuccess({this.error});
}

class InsuranceNetworkError extends InsuranceState {}

class InsuranceSuccess extends InsuranceState {
  InsuranceSuccess(this.InsuranceList);

  final InsuranceModel InsuranceList;
}