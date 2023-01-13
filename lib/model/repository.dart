import 'package:dio/dio.dart';
import 'package:individual_assignment/model/data/photo_list.dart';
import '../core/api_provider.dart';

class PhotoRepository extends ApiProvider {
  final String apiKey = 'client_id=asp6k6c7IDUBcWVHID1-xhWILCE42AfNuQYXCTMj9Hk';

  Future<List<Photo>> photos({
    required int page,
  }) async {
    try {
      Response response = await dio.get('photos?page=$page?$apiKey',
          options: Options(responseType: ResponseType.json));
      List<dynamic> listData = response.data;
      return listData.map((e) => Photo.fromJson(e)).toList();
    } on DioError catch (e) {
      Map<String, dynamic> res = e.response?.data;
      final photoError = Photo.error(
        errorMessage: res['error'].toString(),
      );
      return [photoError];
    }
  }
}
