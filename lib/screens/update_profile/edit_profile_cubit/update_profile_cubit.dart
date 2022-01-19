import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/screens/profile/model/profile_model.dart';
import 'package:image_picker/image_picker.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? userData;
  final profileRepo = ProfileRepo();

  final ImagePicker imagePicker = ImagePicker();
  XFile? imageCamera;

  Future getImageFromCamera() async {
    emit(GetCameraImageLoading());
    try {
      XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);
      imageCamera = photo;
      emit(GetCameraImageSuccess());
    } catch (error) {
      emit(GetCameraImageError());
    }
  }

  Future getImageFromGallery() async {
    final XFile? selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
    emit(GetGalleryImageLoading());
    try {
      imageCamera = selectedImages;
      emit(GetGalleryImageSuccess());
    } catch (error) {
      emit(GetGalleryImageError());
    }
  }

  // update profile
  Future<void> updateUserData(
      {required name,
      required email,
      required phone,
      required image,
      required password}) async {
    emit(UpdateProfileLoading());
    try {
      userData = await profileRepo.updateUserData(
          name: name,
          email: email,
          phone: phone,
          image: image,
          password: password);
      emit(UpdateProfileSuccess(userData!));
    } catch (e) {
      emit(UpdateProfileError());
      rethrow;
    }
  }

  bool isVisibility = true;

  void visibilityPassword() {
    isVisibility = !isVisibility;
    emit(VisibilityPassword());
  }

  // variable bool to change visibility in (confirm field)
  bool confirmNotVisible = true;

  // method to switch icon visibility (in confirm password field )
  void confirmVisibilityPassword() {
    confirmNotVisible = !confirmNotVisible;
    emit(ConfirmVisibilityPassword());
  }
}
