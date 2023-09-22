import 'package:dio/dio.dart';

import '../API/endpoint.dart';
import 'dioClient.dart';




class DioFetchService extends DioClient {
  final DioClient _client =  DioClient();

  Future<Response> fetchGames() async {
    try {
      return await _client
          .init()
          .get(ApiEndPoints.gamesURL);
    } on DioException catch (ex) {
      throw  Exception(ex);
    }
  }
}