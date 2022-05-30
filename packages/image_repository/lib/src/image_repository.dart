import 'package:image_api/image_api.dart';
import 'package:image_repository/src/entity/image_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageRepository {
  final RandomImageRemoteDataSource _imageRemoteDataSource;
  final RandomImageLocalDataSource _imageLocalDataSource;

  ImageRepository({
    RandomImageRemoteDataSource? imageRemoteDataSource,
    RandomImageLocalDataSource? imageLocalDataSource,
    required SharedPreferences sharedPreferences,
  })  : _imageRemoteDataSource =
            imageRemoteDataSource ?? RandomImageRemoteDataSource(),
        _imageLocalDataSource = imageLocalDataSource ??
            RandomImageLocalDataSource(
              sharedPreferences: sharedPreferences,
            );

  // get random image method
  Future<ImageEntity> getRandomImage() async {
    try {
      final data = await _imageRemoteDataSource.getRandomImage();

      await _imageLocalDataSource.save('imageSave', data);

      return ImageEntity(data.message);
    } on Exception catch (e) {
      final item = await _imageLocalDataSource.get('imageSave');

      if (item == null) {
        throw Exception(e.toString());
      } else {
        return ImageEntity(item.message);
      }
    }
  }
}
