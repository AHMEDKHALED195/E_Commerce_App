import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> creatUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement creatUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
