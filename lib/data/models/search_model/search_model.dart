import 'package:udemy_flutter/data/models/favourite_model/favourites_model.dart';

class SearchModel {
  final bool status;
  List<FavouriteDataDetails> data;

  SearchModel({required this.status, required this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'] as bool,
      data: ((json["data"] as Map<String, dynamic>)['data'] as List<dynamic>)
          .map(
            (element) => FavouriteDataDetails.fromJson(element as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
