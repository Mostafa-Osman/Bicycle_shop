abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {}

class HomeBannerLoadingState extends HomeStates {}

class HomeBannerSuccessState extends HomeStates {}

class HomeBannerErrorState extends HomeStates {}

class CounterPlusState extends HomeStates {
  final int plusCounter;

  CounterPlusState(this.plusCounter);
}

class CounterMinusState extends HomeStates {
  final int minusCounter;

  CounterMinusState(this.minusCounter);
}
