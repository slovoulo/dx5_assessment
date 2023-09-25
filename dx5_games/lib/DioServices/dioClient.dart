import "package:dio/dio.dart";

import "../API/baseURL.dart";



///This class sets up Dio to to use the base URL to fetch data
class DioClient {
  Dio init() {
    Dio dio =  Dio();

    dio.options.baseUrl = BaseURL.Baseurl;

    return dio;
  }
}