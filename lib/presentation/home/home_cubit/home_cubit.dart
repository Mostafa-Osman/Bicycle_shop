import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/home_model/banner_model.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/data/repository/home_repository/home_repository.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepository homeRepository;

  HomeCubit(this.homeRepository) : super(HomeInitialState());

  late HomeModel homeModel;
  late BannerModel banner;

  late Map<int, bool> favourites = {};

  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      homeModel = await homeRepository.getHomeData();
      for (final element in homeModel.data.detailsData) {
        favourites.addAll({
          element.id: element.isFavorite,
        });
      }
      banner = await homeRepository.getBannerData();
      emit(HomeSuccess());
    } catch (error, s) {
      log('get home data error', error: error, stackTrace: s);

      emit(HomeError(error.toString()));
    }
  }

  int indicatorIndex = 4;

  void changeBannerIndex(int index) {
    indicatorIndex = index;
    emit(HomeRefreshUi());
  }

  int quantityProduct = 1;

  void incrementOrder() {
    quantityProduct++;
    emit(HomeRefreshUi());
  }

  void decrementOrder() {
    if (quantityProduct != 1) quantityProduct--;
    emit(HomeRefreshUi());
  }
  void changeHomeFavourites(int productId){
   favourites[productId]=
    !favourites[productId]!;
   emit(HomeRefreshUi());

  }
}
