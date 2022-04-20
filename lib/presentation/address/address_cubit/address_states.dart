part of 'address_cubit.dart';

@immutable
abstract class AddressStates {}

class AddressInitial extends AddressStates {}

class GetAddressLoading extends AddressStates {}

class GetAddressSuccess extends AddressStates {}

class GetAddressError extends AddressStates {
  final String message;

  GetAddressError(this.message);
}

class AddAddressLoading extends AddressStates {}

class AddAddressSuccess extends AddressStates {}

class AddAddressError extends AddressStates {
  final String message;

  AddAddressError(this.message);
}
class AddressRefreshUi extends AddressStates {}

class UpdateAddressLoading extends AddressStates {}

class UpdateAddressSuccess extends AddressStates {}

class UpdateAddressError extends AddressStates {
  final String message;

  UpdateAddressError(this.message);
}

class DeleteAddressLoading extends AddressStates {}

class DeleteAddressOrderSuccess extends AddressStates {}

class DeleteAddressError extends AddressStates {}
