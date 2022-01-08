import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/home/home_cubit/states.dart';
import 'package:udemy_flutter/screens/home/model/banner_model.dart';
import 'package:udemy_flutter/screens/home/model/home_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  var favourites = {};


  void getHomeData() {
    DioHelper.getData(
      url: PRODUCT_DETAILS,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.detailsData.forEach((element) {
        favourites.addAll({
          element.id!: element.inFavorites!,
        });
      });
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  BannerModel? banner;

  void getBannerData() {
    emit(HomeBannerLoadingState());
    DioHelper.getData(
      url: BANNER,
      token: token,
    ).then((value) {
      banner = BannerModel.fromJson(value.data);
      emit(HomeBannerSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeBannerErrorState());
    });
  }


  int quantityOrder = 1;

  incrementOrder() {
    quantityOrder++;
    emit(CounterPlusState(quantityOrder));
  }

  decrementOrder() {
    if (quantityOrder != 1) quantityOrder--;
    emit(CounterMinusState(quantityOrder));
  }


}
