import '../../model/response/insurance_model.dart';

abstract class InsuranceOtpState {}

class InsuranceOtpInitial extends InsuranceOtpState {}

class InsuranceOtpProgress extends InsuranceOtpState {}

class InsuranceOtpDelete extends InsuranceOtpState {}

class InsuranceOtpLoading extends InsuranceOtpState {}
class InsuranceOtpButtonActive extends InsuranceOtpState {}

class InsuranceOtpError extends InsuranceOtpState {
  String? error;

  InsuranceOtpError({this.error});
}

class AddInsuranceSuccess extends InsuranceOtpState {
  String? error;

  AddInsuranceSuccess({this.error});
}

class InsuranceNetworkError extends InsuranceOtpState {}

class InsuranceSuccess extends InsuranceOtpState {
  InsuranceSuccess(this.InsuranceList);

  final InsuranceModel InsuranceList;
}