import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/data/models/address_model/get_address_model.dart';
import 'package:udemy_flutter/data/repository/address_repo/address_repo.dart';

part 'address_states.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit(this.addressRepo) : super(AddressInitial());
  final formKey = GlobalKey<FormState>();
  TextEditingController cityControl = TextEditingController();
  TextEditingController addressDetailsControl = TextEditingController();

  TextEditingController regionControl = TextEditingController();

  TextEditingController buildingNumberControl = TextEditingController();
  TextEditingController notesAddressControl = TextEditingController();

  late GetAddressModel addressModel;
  final AddressRepository addressRepo;

  Future<void> addNewAddressData() async {
    emit(AddAddressLoading());
    try {
      await addressRepo.addNewAddressData(
        buildingNumber: buildingNumberControl.text,
        city: cityControl.text,
        region: regionControl.text,
        details: addressDetailsControl.text,
        notes: notesAddressControl.text,
      );

      getMyAddressData();
      emit(AddAddressSuccess());
    } catch (e, s) {
      log('add new address data', error: e.toString(), stackTrace: s);
      emit(AddAddressError(s.toString()));
    }
  }

  //get address
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

  //update address
  Future<void> updateAddressData({
    required int addressId,
    required String buildingNumber,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    emit(UpdateAddressLoading());
    try {
      await addressRepo.updateAddressData(
        addressId: addressId,
        name: buildingNumber,
        city: city,
        region: region,
        details: details,
        notes: notes,
      );
      getMyAddressData();
      emit(UpdateAddressSuccess());
    } catch (e, s) {
      log('update address data', error: e.toString(), stackTrace: s);
      emit(UpdateAddressError(e.toString()));
    }
  }

  //delete address
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

  void clearTextFromField() {
    buildingNumberControl.clear();
    cityControl.clear();
    regionControl.clear();
    addressDetailsControl.clear();
    notesAddressControl.clear();
    emit(AddressRefreshUi());
  }

  void initialTextFromField({
    required String city,
    required String addressDetails,
    required String region,
    required String buildingNumber,
    required String notes,
  }) {
    cityControl = TextEditingController(text: city);
    addressDetailsControl = TextEditingController(text: addressDetails);
    regionControl = TextEditingController(text: region);
    buildingNumberControl = TextEditingController(text: buildingNumber);
    notesAddressControl = TextEditingController(text: notes);
    emit(AddressRefreshUi());
  }
}
