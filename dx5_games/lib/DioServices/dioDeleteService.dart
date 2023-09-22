import 'package:dio/dio.dart';

import '../API/endpoint.dart';
import 'dioClient.dart';



///Service to delete a game
class DioDeleteService extends DioClient {
  final DioClient _client =  DioClient();



  Future<Response> deleteGame(id,) async {
    try {
      return await _client
          .init()
          .delete("${ApiEndPoints.gamesURL}/$id",);
    } on DioException catch (ex) {
      throw  Exception(ex);
    }
  }
}