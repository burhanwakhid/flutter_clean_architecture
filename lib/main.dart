import 'package:flutter/material.dart';
import 'package:image_repository/image_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedpreference = await SharedPreferences.getInstance();

  final imageRepository = ImageRepository(
    sharedPreferences: sharedpreference,
  );

  runApp(
    App(
      imageRepository: imageRepository,
    ),
  );
}

///
/// IF YOU HAVE SETUP YOUR FIREBASE YOU CAN RUN APP WITH THIS SETUP
///

// void main() async {
//   bootstrap(
//     (
//       firebaseAuth,
//       firebaseStore,
//       sharedpreference,
//     ) async {
//       //
//       final imageRepository = ImageRepository(
//         sharedPreferences: sharedpreference,
//       );

//       // Initialize Firebase
//       await Firebase.initializeApp();

//       return App(
//         imageRepository: imageRepository,
//       );
//     },
//   );
// }
