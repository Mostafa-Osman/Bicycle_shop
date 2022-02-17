import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/presentation/product_details/cubit/states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  int indicatorIndex = 0;

  void changeSmallPhotoIndex(index) {
    indicatorIndex = index;
    emit(ChangeSmallPhotoIndexState());
  }
}
