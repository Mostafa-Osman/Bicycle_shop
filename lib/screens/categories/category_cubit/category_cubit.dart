
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/screens/categories/category_cubit/states.dart';
import 'package:udemy_flutter/screens/categories/model/categories_model.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);
CategoriesModel? categoriesModel;

void getCategoriesData() {
  DioHelper.getData(url: Get_CATEGORIES).then((value) {
    categoriesModel = CategoriesModel.fromJson(value.data);
    emit(CategoriesSuccessState());
  }).catchError((error) {
    print(error.toString());
    emit(CategoriesErrorState());
  });
}}