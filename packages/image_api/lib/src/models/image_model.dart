// To parse this JSON data, do
//
//     final imageRandomModel = imageRandomModelFromJson(jsonString);

import 'dart:convert';

ImageRandomModel imageRandomModelFromJson(String str) =>
    ImageRandomModel.fromJson(json.decode(str));

String imageRandomModelToJson(ImageRandomModel data) =>
    json.encode(data.toJson());

class ImageRandomModel {
  ImageRandomModel({
    required this.message,
    required this.status,
  });

  final String message;
  final String status;

  factory ImageRandomModel.fromJson(Map<String, dynamic> json) =>
      ImageRandomModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
