import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.uId,
    required super.displayName,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email!,
      uId: user.uid,
      displayName: user.displayName ?? '',
    );
  }
}
