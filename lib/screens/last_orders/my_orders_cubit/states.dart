abstract class MyOrdersStates {}

class MyOrdersInitialState extends MyOrdersStates {}

class MyOrderLoadingState extends MyOrdersStates {}

class MyOrderSuccessState extends MyOrdersStates {}

class MyOrderErrorState extends MyOrdersStates {}

class OrderDetailsLoadingState extends MyOrdersStates {}

class OrderDetailsSuccessState extends MyOrdersStates {}

class OrderDetailsErrorState extends MyOrdersStates {}

class ChangeAddressVisibilityState extends MyOrdersStates {}
