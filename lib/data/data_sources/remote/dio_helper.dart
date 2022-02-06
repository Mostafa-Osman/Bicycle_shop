import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static int() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //get data
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.get(url, queryParameters: query ?? null);
  }

  //post data
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };

    return await dio!.post(url, queryParameters: query, data: data);
  }

  //update data
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };

    return await dio!.put(url, queryParameters: query, data: data);
  }

  //delete data
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.delete(url, queryParameters: query ?? null);
  }
}
