part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final ProfileModel userModel;

  UpdateProfileSuccess(this.userModel);
}

class UpdateProfileError extends UpdateProfileState {}



class PictureState extends UpdateProfileState {}

class GetCameraImageLoading extends UpdateProfileState {}

class GetCameraImageSuccess extends UpdateProfileState {}

class GetCameraImageError extends UpdateProfileState {}

class GetGalleryImageLoading extends UpdateProfileState {}

class GetGalleryImageSuccess extends UpdateProfileState {}

class GetGalleryImageError extends UpdateProfileState {}
class VisibilityPassword extends UpdateProfileState {}
class ConfirmVisibilityPassword extends UpdateProfileState {}