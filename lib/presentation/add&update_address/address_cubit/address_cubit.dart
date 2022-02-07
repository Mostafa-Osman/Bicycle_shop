import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/repository/address_repo/address_repo.dart';
import 'package:udemy_flutter/presentation/add&update_address/address_cubit/states.dart';
import 'package:udemy_flutter/data/models/address_model/address_model.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(AddressInitial());

  static AddressCubit get(context) => BlocProvider.of(context);

  AddressModel? addressModel;
  final addressRepo = AddressRepo();


  Future<void> addNewAddressData(
      {required name,
      required city,
      required region,
      required details,
      notes}) async {
    emit(AddAddressLoading());
    try {
      addressModel = await addressRepo.addNewAddressData(
          name: name,
          city: city,
          region: region,
          details: details,
          notes: notes);
      emit(AddAddressSuccess());
      getMyAddressData();
    } catch (e, s) {
      print(s.toString());
      emit(AddAddressError());
    }
  }

  //get add&update_address
  Future<void> getMyAddressData() async {
    emit(GetAddressLoading());
    try {
      addressModel = await addressRepo.getMyAddressData();
      emit(GetAddressSuccess());
    } catch (e, s) {
      print(s.toString());
      emit(GetAddressError());
    }
  }

  //update add&update_address
  Future<void> updateAddressData(
      {required addressId, name, city, region, details, notes}) async {
    emit(UpdateAddressLoading());
    try {
      addressModel = await addressRepo.updateAddressData(
          addressId: addressId,
          name: name,
          city: city,
          region: region,
          details: details,
          notes: notes);
      emit(UpdateAddressOrderSuccess());
      getMyAddressData();
    } catch (e, s) {
      print(s.toString());
      emit(UpdateAddressError());
    }
  }

  //delete add&update_address
  Future<void> deleteAddressData({required addressId}) async {
    emit(DeleteAddressLoading());
    try {
      addressModel = await addressRepo.deleteAddressData(addressId: addressId);
      emit(DeleteAddressOrderSuccess());
      getMyAddressData();

    } catch (e, s) {
      print(s.toString());
      emit(DeleteAddressError());
    }
  }
}
