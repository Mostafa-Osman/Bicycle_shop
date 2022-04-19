import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_flutter/data/models/profile_model/profile_model.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateProfileRepository)
      : super(UpdateProfileInitial());

  final ProfileRepository updateProfileRepository;

  final ImagePicker imagePicker = ImagePicker();

  String? imageProfile;

  // take photo from camera
  Future getImageFromCamera() async {
    emit(GetCameraImageLoading());
    try {
      final XFile? photo =
          await imagePicker.pickImage(source: ImageSource.camera);
      convertPhotoToBase64(photo);
      emit(GetCameraImageSuccess());
    } catch (error, s) {
      log('get image from camera', error: error, stackTrace: s);
      emit(GetCameraImageError(error.toString()));
    }
  }

  // take photo from Gallery

  Future getImageFromGallery() async {
    final XFile? selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
    emit(GetGalleryImageLoading());
    try {
      convertPhotoToBase64(selectedImages);
      emit(GetGalleryImageSuccess());
    } catch (error, s) {
      log('get image from gallery', error: error, stackTrace: s);

      emit(GetGalleryImageError(error.toString()));
    }
  }

  //convert Photo To Base64
  Future convertPhotoToBase64(dynamic myFileImage) async {
    // ignore: avoid_dynamic_calls
    final File file = File(myFileImage.path.toString());
    final List<int> fileInByte = file.readAsBytesSync();
    final String fileInBase64 = base64Encode(fileInByte);
    imageProfile = fileInBase64;
  }

  // update profile
  Future<void> updateUserData({
    String? name,
    String? email,
    String? phone,
    String? image,
    String? password,
  }) async {
    emit(UpdateProfileLoading());
    try {
      userData = await updateProfileRepository.updateUserData(
        name: name,
        email: email,
        phone: phone,
        image: image,
        password: password,
      );
      emit(UpdateProfileSuccess(userData));
    } catch (error, s) {
      log('update user data', error: error, stackTrace: s);

      emit(UpdateProfileError(error.toString()));
    }
  }

}
