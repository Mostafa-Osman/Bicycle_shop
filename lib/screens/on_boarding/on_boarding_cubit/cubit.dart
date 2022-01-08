import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/on_boarding/on_boarding_cubit/states.dart';


class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  bool isLast = false;

  List<OnBoardingModel> model = [
  OnBoardingModel(
  image: 'assets/images/splash_1.png', title: 'ON BOARDING', body: "#1"),
  OnBoardingModel(
  image: 'assets/images/splash_2.png', title: 'ON BOARDING', body: "#2"),
  OnBoardingModel(
  image: 'assets/images/splash_3.png', title: 'ON BOARDING', body: "#3"),
  ];


}
class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}