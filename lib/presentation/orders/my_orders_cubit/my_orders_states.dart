abstract class MyOrdersStates {}

class MyOrdersInitial extends MyOrdersStates {}

class MyOrderLoading extends MyOrdersStates {}

class MyOrderSuccess extends MyOrdersStates {}

class MyOrderError extends MyOrdersStates {
  final String message;

  MyOrderError(this.message);
}

class OrderDetailsLoading extends MyOrdersStates {}

class OrderDetailsSuccess extends MyOrdersStates {}

class OrderDetailsError extends MyOrdersStates {
  final String message;

  OrderDetailsError(this.message);
}
