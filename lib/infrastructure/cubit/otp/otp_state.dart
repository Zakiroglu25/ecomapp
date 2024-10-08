// Project imports:

import 'package:uikit/utils/constants/text.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpInProgress extends OtpState {}

class OtpRequested extends OtpState {}

class OtpError extends OtpState {
  String error;

  OtpError({this.error = MyText.unknownError});
}

class OtpSuccess extends OtpState {
  OtpSuccess(this.addComment);

  final String addComment;
}
