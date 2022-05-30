part of 'random_image_bloc.dart';

abstract class RandomImageState extends Equatable {
  const RandomImageState();

  @override
  List<Object> get props => [];
}

class RandomImageInitial extends RandomImageState {}

class RandomImageLoading extends RandomImageState {}

class RandomImageSuccess extends RandomImageState {
  final ImageEntity image;

  const RandomImageSuccess(this.image);

  @override
  List<Object> get props => [image];
}

class RandomImageFailure extends RandomImageState {
  final String error;

  const RandomImageFailure(this.error);

  @override
  List<Object> get props => [error];
}
