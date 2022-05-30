import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_repository/image_repository.dart';
import 'package:random_image/random_image/random_image.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required ImageRepository imageRepository,
  })  : _imageRepository = imageRepository,
        super(key: key);

  final ImageRepository _imageRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _imageRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomImagePage(),
    );
  }
}
