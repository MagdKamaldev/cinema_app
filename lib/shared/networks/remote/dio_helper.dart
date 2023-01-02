//import 'package:cinema_app/main.dart';
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../main.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://92.205.60.182:5431/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // static Future<bool> jwtOrEmpty() async {
  //   try {
  //     return await DioHelper.getData(
  //       url: "GetUser",
  //     ).then((value) {
  //       if (value.statusCode == 200) {
  //         currentUser = User.fromJson(value.data);
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     }).timeout(const Duration(seconds: 4));
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers["Cookie"] = "jwt=$token";
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) {
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
