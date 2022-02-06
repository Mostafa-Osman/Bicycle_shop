import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/screens/home/home_cubit/states.dart';
import 'package:udemy_flutter/screens/home/model/banner_model.dart';
import 'package:udemy_flutter/screens/home/model/home_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';

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
    emit(BannerLoadingState());
    DioHelper.getData(
      url: BANNER,
      token: token,
    ).then((value) {
      banner = BannerModel.fromJson(value.data);
      emit(BannerSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(BannerErrorState());
    });
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
