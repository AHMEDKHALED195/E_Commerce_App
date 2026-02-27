import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirbaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(
          message: 'The account already exists for that email.',
        );
      } else {
        throw CustomExceptions(message: 'Failed to create user.');
      }
    } catch (e) {
      throw CustomExceptions(message: 'Failed to create user.');
    }
  }
}
