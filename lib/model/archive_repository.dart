import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:individual_assignment/core/archive_api.dart';
import 'package:individual_assignment/model/archive/game_list.dart';

class ArchiveRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json',
    responseType: ResponseType.json,
  ));

  Future<List<GameList>?> getGamelists() async {
    try {
      Response response = await dio.get('metadata/sony_playstation2_a/files');
      List<dynamic> res = response.data;
      List<GameList> gamelists =
          res.map((item) => GameList.fromJson(item)).toList();

      return gamelists;
    } on DioError catch (e) {
      return null;
    }
  }
}
