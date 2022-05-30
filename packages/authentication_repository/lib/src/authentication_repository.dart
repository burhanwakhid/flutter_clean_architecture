import 'package:firebase_auth/firebase_auth.dart';

/// author: @burhanwakhid

class AuthenticationRepository {
  const AuthenticationRepository(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  /// sign user anonymously
  Future<void> signedAnonymous() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on Exception catch (error, stacktrace) {
      throw AuthenticationException(error, stacktrace);
    }
  }

  /// sign user with email and password
  /// [email] and [password] must not be null
  Future<void> signedWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (error, stacktrace) {
      throw AuthenticationException(error, stacktrace);
    }
  }
}

/// {@template authentication_exception}
/// Exception for authentication repository failures.
/// {@endtemplate}
class AuthenticationException implements Exception {
  /// {@macro authentication_exception}
  const AuthenticationException(this.error, this.stackTrace);

  /// The error that was caught.
  final Object error;

  /// The Stacktrace associated with the [error].
  final StackTrace stackTrace;
}
