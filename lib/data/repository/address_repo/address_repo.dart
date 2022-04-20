import 'package:udemy_flutter/data/data_sources/remote/dio_helper.dart';
import 'package:udemy_flutter/data/data_sources/remote/end_points.dart';
import 'package:udemy_flutter/data/models/address_model/add_new_address.dart';
import 'package:udemy_flutter/data/models/address_model/get_address_model.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class AddressRepository {
  //add address

  Future<AddNewAddressModel> addNewAddressData({
    required String buildingNumber,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    final response = await DioHelper.postData(
      url: addressesUrl,
      token: token,
      data: {
        'city': city,
        'region': region,
        'details': details,
        'name': buildingNumber,
        'notes': notes,
        'latitude': '0.0',
        'longitude': '0.0',
      },
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddNewAddressModel.fromJson(data);
    }

    throw data['message'] as String;
  }

  //get address
  Future<GetAddressModel> getMyAddressData() async {
    final response = await DioHelper.getData(url: addressesUrl, token: token);
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return GetAddressModel.fromJson(data);
    }
    throw 'server error';
  }

  //update address
  Future<AddNewAddressModel> updateAddressData({
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
      return AddNewAddressModel.fromJson(data);
    }
    throw 'server error';
  }

  //delete address
  Future<AddNewAddressModel> deleteAddressData({required int addressId}) async {
    final response = await DioHelper.deleteData(
      url: '$updateAddressesUrl$addressId',
      token: token,
    );
    final data = response.data as Map<String, dynamic>;
    if (data['status'] == true) {
      return AddNewAddressModel.fromJson(data);
    }
    throw 'server error';
  }
}
