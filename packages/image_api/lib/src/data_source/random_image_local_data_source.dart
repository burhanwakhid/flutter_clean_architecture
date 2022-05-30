import 'dart:convert';

import 'package:image_api/image_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomImageLocalDataSource {
  final SharedPreferences _sharedPreferences;

  RandomImageLocalDataSource({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  // save to local storage
  Future<void> save(String key, ImageRandomModel value) async {
    final item = jsonEncode(value.toJson());
    await _sharedPreferences.setString(key, item);
  }

  // get data image from local storage
  Future<ImageRandomModel?> get(String key) async {
    final item = _sharedPreferences.getString(key);
    if (item == null) {
      return null;
    }
    return ImageRandomModel.fromJson(jsonDecode(item));
  }
}
