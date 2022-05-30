import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';

part 'random_image_event.dart';
part 'random_image_state.dart';

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  final ImageRepository _imageRepository;

  RandomImageBloc({
    required ImageRepository imageRepository,
  })  : _imageRepository = imageRepository,
        super(RandomImageInitial()) {
    ///
    /// This is a good place to initialize your state.
    ///
    on<GetRandomImage>((event, emit) => _getRandomImage(emit, event));
  }

  Future<void> _getRandomImage(
    Emitter<RandomImageState> emit,
    GetRandomImage event,
  ) async {
    emit(RandomImageLoading());
    try {
      final image = await _imageRepository.getRandomImage();
      emit(RandomImageSuccess(image));
    } on Exception catch (e) {
      emit(RandomImageFailure(e.toString()));
    }
  }
}
