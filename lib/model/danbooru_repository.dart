import 'package:dio/dio.dart';
import 'package:individual_assignment/core/danbooru_api_provider.dart';
import 'package:individual_assignment/model/danbooru/post.dart';
import 'package:individual_assignment/model/danbooru/search.dart';

class DanbooruRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json',
    responseType: ResponseType.json,
  ));

  Future<List<Post>?> getPosts() async {
    try {
      Response response = await dio.get('posts.json?limit=10?rating=s');
      List<dynamic> res = response.data;
      List<Post> posts = res.map((item) => Post.fromJson(item)).toList();

      return posts;
    } on DioError catch (e) {
      return null;
    }
  }

  Future<List<Search>?> searchTerm() async {
    try {
      Response response = await dio.get(
          'autocomplete.json?search[type]=tag_query&limit=10&search[query]=naruto');
      List<dynamic> res = response.data;
      List<Search> searches = res.map((item) => Search.fromJson(item)).toList();

      return searches;
    } on DioError catch (e) {
      return null;
    }
  }
}
