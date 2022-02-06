import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  bool isLastPage = false;
  List<OnBoardingModel> items = [
    OnBoardingModel(
        image: 'assets/images/onBoarding_1.svg',
        title: 'Online Cart',
        body:
            "Select and memorize your future pur--chasses with smart online shopping cart"),
    OnBoardingModel(
        image: 'assets/images/onBoarding_2.svg',
        title: 'Payment',
        body: "You can pay by credit card or when you Receiving"),
    OnBoardingModel(
        image: 'assets/images/onBoarding_3.svg',
        title: 'Let\'s Start',
        body: 'Wish for you a good time'),
  ];

  checkLastPage(bool changeText) {
    (changeText) ? isLastPage = true : isLastPage = false;
    emit(CheckLastPageSuccess());
  }
}




class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}
