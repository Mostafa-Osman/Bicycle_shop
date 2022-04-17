import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'on_boarding_states.dart';
class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  bool isLastPage = false;
  List<OnBoardingModel> items = [
    OnBoardingModel(
        image: 'assets/images/onBoarding_1.svg',
        title: 'Online Cart',
        body:
            "Select and memorize your future pur--chasses with smart online shopping cart",),
    OnBoardingModel(
        image: 'assets/images/onBoarding_2.svg',
        title: 'Payment',
        body: "You can pay by credit card or when you Receiving",),
    OnBoardingModel(
        image: 'assets/images/onBoarding_3.svg',
        title: "Let's Start",
        body: 'Wish for you a good time',),
  ];

  void checkLastPage({required bool changeText}) {
    changeText ? isLastPage = true : isLastPage = false;
    emit(CheckLastPageSuccess());
  }
}




class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body,});
}
