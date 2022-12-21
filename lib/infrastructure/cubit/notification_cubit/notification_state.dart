import '../../model/response/Notification_model.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationProgress extends NotificationState {}

class NotificationDelete extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationError extends NotificationState {
  String? error;

  NotificationError({this.error});
}

class NotificationNetworkError extends NotificationState {}

class NotificationSuccess extends NotificationState {
  NotificationSuccess(this.NotificationList);

  final NotificationModel NotificationList;
}
