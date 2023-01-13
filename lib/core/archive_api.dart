import 'package:dio/dio.dart';

const baseUrl = 'https://archive.org/';

class DanbooruApiProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json',
    responseType: ResponseType.json,
  ));
}
