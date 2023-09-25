import 'package:dio/dio.dart';
import 'package:dx5_games/DioServices/dioClient.dart';

import '../API/endpoint.dart';




///Service to update an existing game
class DioPutService extends DioClient {
  final DioClient _client =  DioClient();


  Future<Response> updateGame(id,Map<String, dynamic> body) async {
    try {
      return await _client
          .init()
          .put("${ApiEndPoints.gamesURL}/$id", data: body);
    } on DioException catch (ex) {
      throw  Exception(ex);
    }
  }
}