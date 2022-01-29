import 'dart:developer';

import 'package:udemy_flutter/data/remote/dio_helper.dart';
import 'package:udemy_flutter/data/remote/end_points.dart';
import 'package:udemy_flutter/screens/address/model/address_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class AddressRepo {
  //add address

  Future<AddressModel> addNewAddressData(
      {required name,
        required city,
        required region,
        required details,
        notes}) async {
    try {
      final response =
          await  DioHelper.postData(url: ADDRESSES, token: token, data: {
            'name': name,
            'city': city,
            'region': region,
            'details': details,
            'notes': notes,
            'latitude':0.0,
            'longitude':0.0,
          });
      if (response.data['status'] == true) {
        return AddressModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e, s) {
      log(s.toString());
      rethrow;
    }
  }

  //get address
  Future<AddressModel> getMyAddressData() async {
    try {
      final response = await DioHelper.getData(url: ADDRESSES, token: token);
      if (response.data['status'] == true) {
        return AddressModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e, s) {
      rethrow;
    }
  }

  //update address
  Future<AddressModel> updateAddressData(
      {required addressId, name, city, region, details, notes}) async {
    try {
      final response = await DioHelper.putData(
          url: UPDATE_ADDRESSES + '$addressId',
          token: token,
          data: {
            'name': name,
            'city': city,
            'region': region,
            'details': details,
            'notes': notes,
            'latitude': 0.0,
            'longitude': 0.0,
          });
      if (response.data['status'] == true) {
        return AddressModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e, s) {
      rethrow;
    }
  }

  //delete address
  Future<AddressModel> deleteAddressData({required addressId}) async {
    try {
      final response = await DioHelper.deleteData(
          url: UPDATE_ADDRESSES + '$addressId', token: token);
      if (response.data['status'] == true) {
        return AddressModel.fromJson(response.data);
      }
      throw response.data['message'] ?? 'server error';
    } catch (e, s) {
      rethrow;
    }
  }
}
