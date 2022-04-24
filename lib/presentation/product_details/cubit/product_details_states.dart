part of'product_details_cubit.dart';
@immutable
abstract class ProductDetailsStates {}

class ProductDetailsInitial extends ProductDetailsStates {}

class RefreshUi extends ProductDetailsStates {}
class ProductDetailsLoading extends ProductDetailsStates {}

class ProductDetailsSuccess extends ProductDetailsStates {}

class ProductDetailsError extends ProductDetailsStates {
  final String message;

  ProductDetailsError(this.message);
}
