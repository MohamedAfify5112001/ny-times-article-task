import 'dart:io';

import 'package:dio/dio.dart';

import '../../app/styles/constants/constant.dart';

final class DioHelper {
  static late Dio dio;
  static Future<void> initMyDio() async {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: AppConstants.$baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
  }

  static Future<Response> getRequest(
      {required String endPointPath, required String apiKeyParam}) async {
    dio.options.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    return await dio
        .get(endPointPath, queryParameters: {'api-key': apiKeyParam});
  }
}
