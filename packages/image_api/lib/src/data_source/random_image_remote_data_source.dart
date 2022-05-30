import 'package:dio/dio.dart';
import 'package:image_api/src/models/image_model.dart';

class RandomImageRemoteDataSource {
  RandomImageRemoteDataSource({
    Dio? dio,
  }) : _dio = dio ?? Dio();

  final Dio _dio;

  // get random image method
  Future<ImageRandomModel> getRandomImage() async {
    try {
      final response =
          await _dio.get('https://dog.ceo/api/breeds/image/random');
      return ImageRandomModel.fromJson(response.data);
    } on DioError catch (error) {
      throw Exception(error.message);
    }
  }
}
