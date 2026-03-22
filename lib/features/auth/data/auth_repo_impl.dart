import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/services/firbase_auth_service.dart';
import 'package:e_commerce_app/core/utiles/backend_endpoint.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService fireBaseAuth;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.fireBaseAuth, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await fireBaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        email: user.email!,
        uId: user.uid,
        displayName: name,
      );
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomExceptions catch (e) {
      if (user != null) {
        await fireBaseAuth.deleteUser();
      }
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

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await fireBaseAuth.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await fireBaseAuth.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity userEntity}) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addUserData,
        data: userEntity.toMap(),
      );
    } on CustomExceptions catch (e) {
      log('Exception in AuthRepoImpl.addUserData: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.addUserData: ${e.toString()}');
      return Left(ServerFailure('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
}
