import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String imageUrl;

  const ImageEntity(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}
