import 'package:dio/dio.dart';

import '../API/endpoint.dart';
import 'package:dx5_games/DioServices/dioClient.dart';




///Service to create a new game
class DioPostService extends DioClient {
  final DioClient _client =  DioClient();

  Future<Response> createGame(Map<String, dynamic> body) async {
    try {
      return await _client
          .init()
          .post(ApiEndPoints.gamesURL, data: body);
    } on DioException catch (ex) {
      throw  Exception(ex);
    }
  }


}