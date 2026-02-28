import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/firbase_auth_service.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService fireBaseAuth;

  AuthRepoImpl({required this.fireBaseAuth});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await fireBaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.message}',
      );
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await fireBaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return Left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
}
