import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';
import 'package:random_image/random_image/bloc/random_image_bloc/random_image_bloc.dart';

class RandomImagePage extends StatelessWidget {
  const RandomImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomImageBloc(
        imageRepository: context.read<ImageRepository>(),
      )..add(GetRandomImage()),
      child: const RandomImageView(),
    );
  }
}

class RandomImageView extends StatelessWidget {
  const RandomImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ImageBody(),
    );
  }
}

class ImageBody extends StatelessWidget {
  const ImageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImageBloc, RandomImageState>(
      builder: (context, state) {
        if (state is RandomImageLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RandomImageFailure) {
          return Center(child: Text(state.error));
        } else if (state is RandomImageSuccess) {
          return InkWell(
            onTap: () {
              context.read<RandomImageBloc>().add(GetRandomImage());
            },
            child: CachedNetworkImage(imageUrl: state.image.imageUrl),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
