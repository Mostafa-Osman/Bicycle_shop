import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/search_model/search_model.dart';
import 'package:udemy_flutter/data/repository/search_repository/search_repository.dart';

part 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  SearchRepository searchRepository;
  SearchModel? searchModel;

  Future<void> getSearchData({required String text}) async {
    emit(SearchLoading());
    try {
      searchModel = await searchRepository.getSearchData(text: text);
      if (searchModel!.data[0].discount == null) {
        searchModel!.data[0].discount = 0;
      }
      log(searchModel!.data[0].discount.toString());
      emit(SearchSuccess());
    } catch (error, s) {
      log('get search data', error: error, stackTrace: s);
      emit(SearchError(error.toString()));
    }
  }

  void resetSearch() {
    searchModel = null;
    emit(SearchRefreshUi());
  }
}
