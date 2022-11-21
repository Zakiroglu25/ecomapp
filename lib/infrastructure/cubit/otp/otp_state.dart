// Project imports:

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpInProgress extends OtpState {}

class OtpSocketError extends OtpState {}

class OtpError extends OtpState {
  String? error;

  OtpError({this.error});
}

class OtpSuccess extends OtpState {
  OtpSuccess(this.addComment);

  final String addComment;
}
