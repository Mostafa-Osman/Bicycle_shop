abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class SwitchDiscountState extends PaymentStates {}

class SwitchVoucherState extends PaymentStates {}

class IsOnlineState extends PaymentStates {}

class CreditCardModelChangeSuccess extends PaymentStates {}

class MakeOrderLoadingState extends PaymentStates {}

class MakeOrderSuccessState extends PaymentStates {}

class MakeOrderErrorState extends PaymentStates {}
class ChangeAddressIndex extends PaymentStates {}