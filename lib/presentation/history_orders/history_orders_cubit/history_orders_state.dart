part of 'history_orders_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class HistoryOrdersLoading extends OrderDetailsState {}

class HistoryOrdersSuccess extends OrderDetailsState {}

class HistoryOrdersError extends OrderDetailsState {
  final String message;

  HistoryOrdersError(this.message);
}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsRefreshUi extends OrderDetailsState {}

class OrderDetailsSuccess extends OrderDetailsState {
  final String? message;

  OrderDetailsSuccess({this.message});
}

class OrderDetailsError extends OrderDetailsState {
  final String errorMessage;

  OrderDetailsError({required this.errorMessage});
}

class ChangeAddressVisibility extends OrderDetailsState {}

class OrderCancelLoading extends OrderDetailsState {}

class OrderCancelSuccess extends OrderDetailsState {}

class OrderCancelError extends OrderDetailsState {
  final String errorMessage;

  OrderCancelError({required this.errorMessage});
}
