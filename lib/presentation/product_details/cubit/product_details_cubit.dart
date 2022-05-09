import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/basket_model/basket_get_orders_model.dart';
import 'package:udemy_flutter/data/models/product_details_model/product_details_model.dart';
import 'package:udemy_flutter/data/repository/product_details_repository/product_details_repository.dart';

part 'product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit(this.productDetailsRepository)
      : super(ProductDetailsInitial());

  int indicatorIndex = 0;
  int productQuantity = 1;


  ProductDetailsRepository productDetailsRepository;

  late ProductDetailsModel productDetailsModel;

  Future<void> getProductDetailsData({required int productId}) async {
    productDetailsQuantity(resetQuantity: true);
    emit(ProductDetailsLoading());
    try {
      productDetailsModel = await productDetailsRepository
          .getProductDetailsData(productId: productId);
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

  void productDetailsQuantity({
    bool isIncrement = false,
    bool resetQuantity = false,
  }) {
    if (resetQuantity) {
      productQuantity = 1;
    } else if (isIncrement) {
      productQuantity++;
    } else {
      if (productQuantity > 1) {
        productQuantity--;
      }
    }
    emit(RefreshUi());
  }

  bool isProductInCart(int id, List<Cart> cartItems) {
    for (int i = 0; i < cartItems.length; ++i) {
      if (cartItems[i].product.id == id) {
        return true;
      }
    }
    return false;
  }


}
