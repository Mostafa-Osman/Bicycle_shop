part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final ProfileModel userModel;

  UpdateProfileSuccess(this.userModel);
}

class UpdateProfileError extends UpdateProfileState {
  final String message;

  UpdateProfileError(this.message);
}

class GetCameraImageLoading extends UpdateProfileState {}

class GetCameraImageSuccess extends UpdateProfileState {}

class GetCameraImageError extends UpdateProfileState {
  final String message;

  GetCameraImageError(this.message);
}

class GetGalleryImageLoading extends UpdateProfileState {}

class GetGalleryImageSuccess extends UpdateProfileState {}

class GetGalleryImageError extends UpdateProfileState {
  final String message;

  GetGalleryImageError(this.message);
}
