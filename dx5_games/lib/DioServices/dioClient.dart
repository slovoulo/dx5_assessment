import "package:dio/dio.dart";

import '../API/baseurl.dart';

class DioClient {
  Dio init() {
    Dio dio =  Dio();

    dio.options.baseUrl = BaseURL.Baseurl;

    return dio;
  }
}