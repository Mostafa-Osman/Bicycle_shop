// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:udemy_flutter/data/remote/dio_helper.dart';
// import 'package:udemy_flutter/data/remote/end_points.dart';
// import 'package:udemy_flutter/screens/address/address_cubit/states.dart';
// import 'package:udemy_flutter/screens/address/model/address_model.dart';
// import 'package:udemy_flutter/shared/components/constants.dart';
//
// class AddressCubit extends Cubit<AddressStates> {
//   AddressCubit() : super(AddressInitial());
//
//   static AddressCubit get(context) => BlocProvider.of(context);
//
//   AddressModel? addressModel;
//
//   //add address
//
//   void addNewAddressData(
//       {required name,
//       required city,
//       required region,
//       required details,
//       notes}) {
//     emit(AddAddressLoading());
//     DioHelper.postData(url: ADDRESSES, token: token, data: {
//       'name': name,
//       'city': city,
//       'region': region,
//       'details': details,
//       'notes': notes,
//       'latitude':0.0,
//       'longitude':0.0,
//     }).then((value) {
//       addressModel = AddressModel.fromJson(value.data);
//       emit(AddAddressSuccess());
//
//       getMyAddressData();
//     }).catchError((error) {
//       print(error.toString());
//       emit(AddAddressError());
//     });
//   }
//
//   void getMyAddressData() {
//     emit(GetAddressLoading());
//     DioHelper.getData(url: ADDRESSES, token: token).then((value) {
//       addressModel = AddressModel.fromJson(value.data);
//       emit(GetAddressSuccess());
//       print(addressModel!.data!.data!.length);
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetAddressError());
//     });
//   }
//
//   //update address
//   Future<void> updateAddressData(
//       {required addressId, name, city, region, details, notes}) async {
//     emit(UpdateAddressLoading());
//
//     DioHelper.putData(
//         url: UPDATE_ADDRESSES + '$addressId',
//         token: token,
//         data: {
//           'name': name,
//           'city': city,
//           'region': region,
//           'details': details,
//           'notes': notes,
//           'latitude':0.0,
//           'longitude':0.0,
//         }).then((value) {
//       addressModel = AddressModel.fromJson(value.data);
//       emit(UpdateAddressOrderSuccess());
//       getMyAddressData();
//     }).catchError((error) {
//       print(error.toString());
//       emit(UpdateAddressError());
//     });
//   }
//
//   //delete address
//   Future<void> deleteAddressData({required addressId}) async {
//     emit(DeleteAddressLoading());
//
//     DioHelper.deleteData(url: UPDATE_ADDRESSES + '$addressId', token: token)
//         .then((value) {
//       addressModel = AddressModel.fromJson(value.data);
//       emit(DeleteAddressOrderSuccess());
//       getMyAddressData();
//     }).catchError((error) {
//       print(error.toString());
//       emit(DeleteAddressError());
//     });
//   }
// }
