import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/home_model/home_model.dart';
import 'package:udemy_flutter/data/repository/home_repo/home_repo.dart';
import 'package:udemy_flutter/presentation/home/home_cubit/states.dart';
import 'package:udemy_flutter/data/models/home_model/banner_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  var favourites = {};
  HomeRepo _homeRepo = HomeRepo();

  Future<void> getHomeData() async {
    try {
      homeModel = await _homeRepo.getHomeData();
      homeModel!.data!.detailsData.forEach((element) {
        favourites.addAll({
          element.id!: element.inFavorites!,
        });
      });
      emit(HomeSuccessState());
    } catch (error) {
      print(error.toString());
      emit(HomeErrorState());
    }
  }

  BannerModel? banner;

  Future<void> getBannerData() async {
    try {
      emit(BannerLoadingState());
      banner = await _homeRepo.getBannerData();
      emit(BannerSuccessState());
    } catch (error) {
      print(error.toString());
      emit(BannerErrorState());
    }
  }

  int indicatorIndex = 4;
  void changeBannerIndex(index) {
    indicatorIndex = index;
    emit(ChangeBannerIndexState());
  }




  int photoIndex = 0;

  changePhotoIndex(index) {
    photoIndex = index;
    emit(ChangePhotoIndexState());
  }

  int quantityProduct = 1;

  incrementOrder() {
    quantityProduct++;
    emit(CounterPlusState());
  }

  decrementOrder() {
    if (quantityProduct != 1) quantityProduct--;
    emit(CounterMinusState());
  }
}
