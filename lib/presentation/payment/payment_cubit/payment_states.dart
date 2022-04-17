part of 'payment_cubit.dart';

abstract class PaymentStates {}

class PaymentInitial extends PaymentStates {}

class PaymentRefreshUi extends PaymentStates {}

class MakeOrderLoading extends PaymentStates {}

class MakeOrderSuccess extends PaymentStates {}

class MakeOrderError extends PaymentStates {
  final String message;

  MakeOrderError(this.message);
}

class EstimateOrderLoading extends PaymentStates {}

class EstimateOrderSuccess extends PaymentStates {}

class EstimateOrderError extends PaymentStates {
  final String message;

  EstimateOrderError(this.message);
}

class PromoCodeLoading extends PaymentStates {}

class PromoCodeSuccess extends PaymentStates {}

class PromoCodeError extends PaymentStates {
  final String message;

  PromoCodeError(this.message);
}
