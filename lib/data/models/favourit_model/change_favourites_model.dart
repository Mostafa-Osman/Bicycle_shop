class ChangeFavouritesModel {
  bool? status;
  String? message;

  ChangeFavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status']as bool;
    message = json['message']as String;
  }
}
