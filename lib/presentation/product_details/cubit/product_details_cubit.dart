import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/product_details_model/product_details_model.dart';
import 'package:udemy_flutter/data/repository/product_details_repository/product_details_repository.dart';

part 'product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit(this.productDetailsRepository)
      : super(ProductDetailsInitial());

  int indicatorIndex = 0;
  ProductDetailsRepository productDetailsRepository;

  late ProductDetailsModel productDetailsModel;

  Future<void> getProductDetailsData({required int productId}) async {
    emit(ProductDetailsLoading());
    try {
      productDetailsModel =
          await productDetailsRepository.getProductDetailsData(productId: productId);

      emit(ProductDetailsSuccess());
    } catch (error, s) {
      log('get product detailsData error', error: error, stackTrace: s);

      emit(ProductDetailsError(error.toString()));
    }
  }

  void changeSmallPhotoIndex(int index) {
    indicatorIndex = index;
    emit(RefreshUi());
  }

}
