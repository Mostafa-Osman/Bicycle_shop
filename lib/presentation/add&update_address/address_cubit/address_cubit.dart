import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/address_model/get_address_model.dart';
import 'package:udemy_flutter/data/repository/address_repo/address_repo.dart';

part 'address_states.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit(this.addressRepo) : super(AddressInitial());

  late GetAddressModel addressModel;
  final AddressRepository addressRepo;

  Future<void> addNewAddressData({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    emit(AddAddressLoading());
    try {
       await addressRepo.addNewAddressData(
        name: name,
        city: city,
        region: region,
        details: details,
        notes: notes,
      );
       addressModel = await addressRepo.getMyAddressData();
       emit(AddAddressSuccess());

    } catch (e, s) {
      log('add new address data', error: e.toString(), stackTrace: s);
      emit(AddAddressError(s.toString()));
    }
  }

  //get add&update_address
  Future<void> getMyAddressData() async {
    emit(GetAddressLoading());
    try {
      addressModel = await addressRepo.getMyAddressData();

      emit(GetAddressSuccess());
    } catch (e, s) {
      log('add get my address data', error: e.toString(), stackTrace: s);
      emit(GetAddressError(s.toString()));
    }
  }

  //update add&update_address
  Future<void> updateAddressData({
    required int addressId,
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    emit(UpdateAddressLoading());
    try {
       await addressRepo.updateAddressData(
        addressId: addressId,
        name: name,
        city: city,
        region: region,
        details: details,
        notes: notes,
      );
       addressModel = await addressRepo.getMyAddressData();

       emit(UpdateAddressOrderSuccess());
    } catch (e, s) {
      log('add update address data', error: e.toString(), stackTrace: s);
      emit(UpdateAddressError(e.toString()));
    }
  }

  //delete add&update_address
  Future<void> deleteAddressData({required int addressId}) async {
    emit(DeleteAddressLoading());
    try {
       await addressRepo.deleteAddressData(addressId: addressId);
       addressModel = await addressRepo.getMyAddressData();

       emit(DeleteAddressOrderSuccess());
    } catch (e, s) {
      log(s.toString());
      emit(DeleteAddressError());
    }
  }
}