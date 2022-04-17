import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/address_model/address_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class AddressRepository {
  //add add&update_address

  Future<AddressModel> addNewAddressData({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    final response = await DioHelper.postData(
      url: addressesUrl,
      token: token,
      data: {
        'name': name,
        'city': city,
        'region': region,
        'details': details,
        'notes': notes,
        'latitude': 0.0,
        'longitude': 0.0,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddressModel.fromJson(data);
    }
    throw 'server error';
  }

  //get add&update_address
  Future<AddressModel> getMyAddressData() async {
    final response = await DioHelper.getData(url: addressesUrl, token: token);
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddressModel.fromJson(data);
    }
    throw 'server error';
  }

  //update add&update_address
  Future<AddressModel> updateAddressData({
    required int addressId,
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    final response = await DioHelper.putData(
      url: '$updateAddressesUrl$addressId',
      token: token,
      data: {
        'name': name,
        'city': city,
        'region': region,
        'details': details,
        'notes': notes,
        'latitude': 0.0,
        'longitude': 0.0,
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddressModel.fromJson(data);
    }
    throw 'server error';
  }

  //delete add&update_address
  Future<AddressModel> deleteAddressData({required int addressId}) async {
    final response = await DioHelper.deleteData(
      url: '$updateAddressesUrl$addressId',
      token: token,
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddressModel.fromJson(data);
    }
    throw 'server error';
  }
}
