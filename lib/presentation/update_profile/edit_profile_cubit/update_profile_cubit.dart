import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/user_repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_flutter/data/models/profile_model/profile_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  final profileRepo = ProfileRepo();

  final ImagePicker imagePicker = ImagePicker();

  String? imageProfile;

  // take photo from camera
  Future getImageFromCamera() async {
    emit(GetCameraImageLoading());
    try {
      XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);
      convertPhotoToBase64(photo);
      emit(GetCameraImageSuccess());
    } catch (error) {
      emit(GetCameraImageError());
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
    } catch (error) {
      emit(GetGalleryImageError());
    }
  }

  //convert Photo To Base64
  Future convertPhotoToBase64(myFileImage) async {
    File file = File(myFileImage.path);
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    imageProfile = fileInBase64;
  }


  // update profile
  Future<void> updateUserData({name, email, phone, image, password}) async {
    emit(UpdateProfileLoading());
    try {
      userData = await profileRepo.updateUserData(
        name: name,
        email: email,
        phone: phone,
        image: image,
       password: password
      );
      emit(UpdateProfileSuccess(userData!));
    } catch (error) {
      emit(UpdateProfileError(error));
      rethrow;
    }
  }
}
