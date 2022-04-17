part of 'notification_cubit.dart';
@immutable
abstract class NotificationStates {}

class NotificationStatesInitial extends NotificationStates {}

class NotificationsLoading extends NotificationStates {}

class NotificationsSuccess extends NotificationStates {}

class NotificationsError extends NotificationStates {
  final String message;

  NotificationsError(this.message);

}
