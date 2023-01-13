import 'dart:io';

import 'package:dio/dio.dart';

const baseUrl = 'https://api.unsplash.com/';
const apiKey = 'asp6k6c7IDUBcWVHID1-xhWILCE42AfNuQYXCTMj9Hk';

class ApiProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json',
    responseType: ResponseType.plain,
    headers: {
      HttpHeaders.authorizationHeader: 'Client-ID $apiKey',
    },
  ));
}
