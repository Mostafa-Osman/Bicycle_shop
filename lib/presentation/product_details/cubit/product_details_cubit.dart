import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_details_states.dart';
class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  int indicatorIndex = 0;

  void changeSmallPhotoIndex(int index) {
    indicatorIndex = index;
    emit(ChangeSmallPhotoIndex());
  }
}
