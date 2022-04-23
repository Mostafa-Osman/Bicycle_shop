import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  int indicatorIndex = 0;
  int changeQuantity = 1;

  void changeSmallPhotoIndex(int index) {
    indicatorIndex = index;
    emit(ChangeSmallPhotoIndex());
  }

  void quantityItem({bool isIncrement = false, bool resetQuantity = false}) {
    if (resetQuantity) {
      changeQuantity = 1;
    } else if (isIncrement) {
      changeQuantity++;
    } else {
      if (changeQuantity > 1) {
        changeQuantity--;
      }
    }
    emit(ChangeSmallPhotoIndex());
  }
}
